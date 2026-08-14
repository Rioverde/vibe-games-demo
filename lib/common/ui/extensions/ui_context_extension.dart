import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';
import 'package:vibe_games_demo/theme/colors_scheme.dart';
import 'package:vibe_games_demo/theme/text_style.dart';

/// Convenience getters on [BuildContext] for theme, sizes and design scaling.
extension UIContextExtension on BuildContext {
  MediaQueryData get mq => MediaQuery.of(this);

  Size get sizeOf => MediaQuery.sizeOf(this);
  EdgeInsets get paddingOf => MediaQuery.paddingOf(this);

  double get width => sizeOf.width;
  double get height => sizeOf.height;

  double get safeAreaLeft => paddingOf.left;
  double get safeAreaRight => paddingOf.right;

  ColorsScheme get colors => getIt<ColorsScheme>();

  /// Logical pixels per design-frame unit.
  ///
  /// The mockup is a fixed 2320×1080 landscape frame. The scale fits *both*
  /// axes: scaling by height alone overflows every screen proportionally
  /// narrower than the mockup — an iPad in landscape would need ~600px more
  /// width than it has. Whichever axis has slack turns into air that the
  /// flexible bands absorb, rather than into clipped content.
  double get designScale => math.min(
    height / AppLayout.frameHeight,
    width / AppLayout.frameWidth,
  );

  /// Design-frame units → logical pixels.
  double s(double value) => value * designScale;

  AppTextStyles get textStyles => getIt<AppTextStyles>().scaled(designScale);
}
