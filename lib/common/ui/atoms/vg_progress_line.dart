import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// A rounded rail that fills from the left.
///
/// The fill is tweened rather than laid out straight away: buying a level has
/// to visibly push the rail forward, and animating the decoration inside a
/// [FractionallySizedBox] would only recolour a bar that jumps to its new width.
class VGProgressLine extends StatelessWidget {
  const VGProgressLine({
    required this.progress,
    required this.color,
    this.thickness = VGProgressLine.defaultThickness,
    this.duration = AppDurations.medium,
    super.key,
  });

  /// Rail thickness in design units.
  static const double defaultThickness = 10;

  /// 0..1 share of the rail that is filled.
  final double progress;

  final Color color;

  /// Rail height in design units.
  final double thickness;

  final Duration duration;

  @override
  Widget build(BuildContext context) {
    final height = context.s(thickness);
    final radius = BorderRadius.circular(height / 2);

    return SizedBox(
      height: height,
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: context.colors.textPrimary.withValues(alpha: 0.15),
                borderRadius: radius,
              ),
            ),
          ),
          Positioned.fill(
            child: TweenAnimationBuilder<double>(
              tween: Tween(end: progress.clamp(0.0, 1.0)),
              duration: duration,
              curve: Curves.easeOutCubic,
              builder: (context, value, child) => FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: value,
                child: child,
              ),
              child: DecoratedBox(
                decoration: BoxDecoration(color: color, borderRadius: radius),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
