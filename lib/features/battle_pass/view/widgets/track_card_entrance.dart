import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_entrance_spec.dart';

/// Fades a track card in while it rises and settles to full size.
///
/// Cards share one controller and differ only by their slice of it, so the row
/// deals itself out from the left instead of every card popping at once.
class TrackCardEntrance extends StatelessWidget {
  const TrackCardEntrance({
    required this.animation,
    required this.index,
    required this.child,
    super.key,
  });

  /// Drives the whole row, 0..1.
  final Animation<double> animation;

  /// Position of the card in the row, counted from the left.
  final int index;

  final Widget child;

  /// The slice of the row animation this card runs on.
  ///
  /// Late cards would fall outside 0..1 on a long track, so the start is capped
  /// and the tail of the row comes in together rather than never.
  Interval get _interval {
    final start = (index * TrackEntranceSpec.stagger).clamp(0.0, 1 - TrackEntranceSpec.cardShare);
    return Interval(start, start + TrackEntranceSpec.cardShare, curve: Curves.easeOutCubic);
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        // The interval is applied to the raw value rather than wrapped in a
        // CurvedAnimation: building one here would subscribe a fresh listener
        // to the controller on every frame and never let go of the old ones.
        final value = _interval.transform(animation.value.clamp(0.0, 1.0));
        return Opacity(
          opacity: value,
          child: Transform.translate(
            offset: Offset(0, (1 - value) * context.s(TrackEntranceSpec.rise)),
            child: Transform.scale(
              scale: TrackEntranceSpec.scale + (1 - TrackEntranceSpec.scale) * value,
              child: child,
            ),
          ),
        );
      },
      child: child,
    );
  }
}
