import 'dart:math' as math;

import 'package:flutter/rendering.dart';

/// Draws the level ring: a full track plus an arc for the experience gained.
class LevelRingPainter extends CustomPainter {
  const LevelRingPainter({
    required this.fill,
    required this.stroke,
    required this.trackColor,
    required this.progressColor,
  });

  /// 0..1 share of the ring that is filled.
  final double fill;

  /// Ring thickness in logical pixels.
  final double stroke;

  final Color trackColor;
  final Color progressColor;

  @override
  void paint(Canvas canvas, Size size) {
    final center = (Offset.zero & size).center;
    final radius = (size.shortestSide - stroke) / 2;

    Paint ring(Color color) => Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = stroke
      ..strokeCap = StrokeCap.round
      ..color = color;

    canvas.drawCircle(center, radius, ring(trackColor));
    if (fill <= 0) return;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -math.pi / 2,
      2 * math.pi * fill.clamp(0.0, 1.0),
      false,
      ring(progressColor),
    );
  }

  @override
  bool shouldRepaint(LevelRingPainter oldDelegate) =>
      oldDelegate.fill != fill ||
      oldDelegate.stroke != stroke ||
      oldDelegate.trackColor != trackColor ||
      oldDelegate.progressColor != progressColor;
}
