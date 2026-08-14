import 'package:flutter/rendering.dart';

/// Draws the level-up arrow the promo button carries once the pass is owned.
///
/// The exported Figma vector transcribed into Dart: kept as a path so it stays
/// crisp at any scale and takes its colour from the theme, without pulling in
/// an SVG runtime for one shape.
class LevelUpIconPainter extends CustomPainter {
  const LevelUpIconPainter({required this.color});

  final Color color;

  /// The viewBox the path was authored in.
  static const Size viewBox = Size(36, 36);

  @override
  void paint(Canvas canvas, Size size) {
    final path = Path()
      ..moveTo(3.66122, 14.4578)
      ..lineTo(16.2114, 0.789513)
      ..cubicTo(17.1694, -0.262845, 18.8064, -0.262845, 19.7764, 0.789513)
      ..lineTo(32.3388, 14.4702)
      ..cubicTo(33.7939, 16.0549, 32.6904, 18.6673, 30.5563, 18.6673)
      ..lineTo(25.2107, 18.6673)
      ..lineTo(25.2107, 33.5117)
      ..cubicTo(25.2107, 34.886, 24.1194, 36.0002, 22.7734, 36.0002)
      ..lineTo(13.2145, 36.0002)
      ..cubicTo(11.8685, 36.0002, 10.7772, 34.886, 10.7772, 33.5117)
      ..lineTo(10.7772, 18.6673)
      ..lineTo(5.44371, 18.6673)
      ..cubicTo(3.30957, 18.6673, 2.20612, 16.0673, 3.66122, 14.4702)
      ..close();

    canvas
      ..save()
      ..scale(size.width / viewBox.width, size.height / viewBox.height)
      ..drawPath(path, Paint()..color = color)
      ..restore();
  }

  @override
  bool shouldRepaint(LevelUpIconPainter oldDelegate) => oldDelegate.color != color;
}
