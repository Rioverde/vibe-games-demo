import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

/// Typography from the Figma frames.
///
/// Sizes are stated in design-frame units; `context.textStyles` hands back a
/// copy already scaled to the device, so call sites never do the arithmetic.
/// Geologica ships as one variable file, so the weight goes through
/// [FontVariation] — `fontWeight` alone would not move the `wght` axis.
@singleton
class AppTextStyles {
  AppTextStyles() : _scale = 1;

  const AppTextStyles._(this._scale);

  static const String _family = 'Geologica';

  /// Figma tracks every text style at -1% of its size.
  static const double _tracking = -0.01;

  final double _scale;

  /// A copy of the set rendered at [scale] design units per logical pixel.
  AppTextStyles scaled(double scale) => AppTextStyles._(scale);

  TextStyle _style({required double size, required int weight, required double height}) {
    final scaled = size * _scale;
    return TextStyle(
      fontFamily: _family,
      fontSize: scaled,
      height: height,
      letterSpacing: scaled * _tracking,
      fontWeight: FontWeight.values[(weight ~/ 100) - 1],
      fontVariations: [FontVariation('wght', weight.toDouble())],
    );
  }

  /// 48/600 — season title in the info bar, quest screen heading.
  TextStyle get h1 => _style(size: 48, weight: 600, height: 0.93);

  /// 42/600 — current level inside the progress ring.
  TextStyle get h2 => _style(size: 42, weight: 600, height: 1.3);

  /// 36/600 — hero reward name, promo heading.
  TextStyle get h3 => _style(size: 36, weight: 600, height: 1.3);

  /// 30/500 — primary button label.
  TextStyle get button => _style(size: 30, weight: 500, height: 1.2);

  /// 26/500 — secondary button, counters, timer.
  TextStyle get body => _style(size: 26, weight: 500, height: 1.2);

  /// 22/500 — captions, quest text, level pins.
  TextStyle get caption => _style(size: 22, weight: 500, height: 1.2);
}
