import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_progress_line.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// The piece of rail that belongs to one slot of the track.
///
/// The rail used to be one long bar positioned by hand across the row, which
/// meant its width and offset had to be recomputed from slot maths every time
/// the track changed. Composing it per slot keeps every number local: a slot
/// draws half a rail towards each neighbour it has, so the ends of the row stop
/// cleanly without anyone measuring the whole thing.
///
/// Each half carries how much of *itself* is earned rather than a plain "the
/// level is behind us" flag. A flag can only ever be on or off, so the rail
/// jumped a whole half-segment at a time; a fraction lets it grow with the
/// experience.
///
/// The fractions arrive already animated. A segment that tweened its own halves
/// would run every piece of rail on its own clock, and the row would read as
/// several bars filling at once instead of one front travelling along it.
class TrackRailSegment extends StatelessWidget {
  const TrackRailSegment({
    required this.hasPrevious,
    required this.hasNext,
    required this.fillBefore,
    required this.fillAfter,
    super.key,
  });

  final bool hasPrevious;
  final bool hasNext;

  /// 0..1 share of the half towards the previous / next pin that is earned.
  final double fillBefore;
  final double fillAfter;

  Widget _half(BuildContext context, {required bool visible, required double fill}) => Expanded(
    child: visible
        ? Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: context.colors.textPrimary.withValues(alpha: 0.15)),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: fill.clamp(0.0, 1.0),
                child: ColoredBox(color: context.colors.track),
              ),
            ],
          )
        : const SizedBox.shrink(),
  );

  @override
  Widget build(BuildContext context) => SizedBox(
    height: context.s(VGProgressLine.defaultThickness),
    child: Row(
      // Stretch, so each half is told how tall to be. A DecoratedBox has no
      // child to measure, so under loose constraints it would take the smallest
      // size allowed — zero height — and the rail would vanish.
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        _half(context, visible: hasPrevious, fill: fillBefore),
        _half(context, visible: hasNext, fill: fillAfter),
      ],
    ),
  );
}
