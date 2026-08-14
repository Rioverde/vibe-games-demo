import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// The stacked blurred ellipses from the mockup, as a radial gradient.
class HeroBacklight extends StatelessWidget {
  const HeroBacklight({required this.intensity, super.key});

  /// Multiplier driven by the breathing animation.
  final double intensity;

  @override
  Widget build(BuildContext context) {
    final size = context.s(720);

    return SizedBox(
      width: size,
      height: size,
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: RadialGradient(
            colors: [
              context.colors.heroGlow.withValues(alpha: 0.22 * intensity),
              context.colors.heroGlow.withValues(alpha: 0.06 * intensity),
              context.colors.heroGlow.withValues(alpha: 0),
            ],
            stops: const [0, 0.45, 1],
          ),
        ),
      ),
    );
  }
}
