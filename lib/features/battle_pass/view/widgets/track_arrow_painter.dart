import 'package:flutter/rendering.dart';

/// Draws the chevron that separates two reward cards.
///
/// The path is the exported Figma vector transcribed into Dart. Keeping it as a
/// path rather than an image means it stays crisp at any scale and takes its
/// colour from the theme, and it saves pulling in an SVG runtime for one shape.
class TrackArrowPainter extends CustomPainter {
  const TrackArrowPainter({required this.color});

  final Color color;

  /// The viewBox the path was authored in.
  static const Size viewBox = Size(12, 20);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(0.020346, 17.648)
      ..lineTo(2.09001, 1.79544)
      ..cubicTo(2.32881, -0.030941, 4.58753, -0.646576, 5.67211, 0.810427)
      ..lineTo(11.5826, 8.73159)
      ..cubicTo(12.2095, 9.57296, 12.1199, 10.7529, 11.3836, 11.4917)
      ..lineTo(3.40345, 19.4129)
      ..cubicTo(2.03031, 20.7775, -0.238362, 19.5873, 0.020346, 17.648)
      ..close();

    canvas
      ..save()
      ..scale(size.width / viewBox.width, size.height / viewBox.height)
      ..drawPath(path, Paint()..color = color)
      ..restore();
  }

  @override
  bool shouldRepaint(TrackArrowPainter oldDelegate) => oldDelegate.color != color;
}
