import 'package:flutter/widgets.dart';

/// Fades the horizontal edges of its child instead of cutting them off.
///
/// A scroll viewport clips on a hard line, which reads as a rendering glitch
/// when cards slide under it. Masking the same edge with a gradient makes the
/// content run out of the strip rather than get chopped.
class VGEdgeFade extends StatelessWidget {
  const VGEdgeFade({
    required this.child,
    this.leftFade = 0,
    this.rightFade = 0,
    super.key,
  });

  final Widget child;

  /// Width of the fade on each side, in logical pixels. Zero leaves that edge
  /// untouched, so a row parked at the start keeps its crisp left border.
  final double leftFade;
  final double rightFade;

  @override
  Widget build(BuildContext context) {
    if (leftFade <= 0 && rightFade <= 0) return child;

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        if (!width.isFinite || width <= 0) return child;

        // Kept apart and inside 0..1 so the stops stay strictly increasing even
        // when both fades are wide and the strip is narrow.
        final left = (leftFade / width).clamp(0.0, 0.45);
        final right = 1 - (rightFade / width).clamp(0.0, 0.45);

        return ShaderMask(
          blendMode: BlendMode.dstIn,
          shaderCallback: (bounds) => LinearGradient(
            colors: const [
              Color(0x00FFFFFF),
              Color(0xFFFFFFFF),
              Color(0xFFFFFFFF),
              Color(0x00FFFFFF),
            ],
            stops: [0, left, right, 1],
          ).createShader(bounds),
          child: child,
        );
      },
    );
  }
}
