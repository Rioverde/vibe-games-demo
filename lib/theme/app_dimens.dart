/// Spacing, radii, borders and icon sizes, in design-frame units.
///
/// Named by their value on purpose. These are measurements taken off a fixed
/// 2320×1080 frame, not an abstract rhythm, so `x16` says exactly what the
/// mockup says while still giving the file a closed vocabulary: anything that
/// reaches for a number outside these classes is either a real one-off (and
/// belongs in `C` under a name that explains it) or a slip.
abstract final class AppInsets {
  static const double x2 = 2;
  static const double x4 = 4;
  static const double x8 = 8;
  static const double x10 = 10;
  static const double x12 = 12;
  static const double x14 = 14;
  static const double x16 = 16;
  static const double x20 = 20;
  static const double x22 = 22;
  static const double x24 = 24;
  static const double x26 = 26;
  static const double x28 = 28;
  static const double x30 = 30;
  static const double x32 = 32;
  static const double x36 = 36;
  static const double x40 = 40;
  static const double x48 = 48;
}

abstract final class AppRadius {
  /// Quantity pills.
  static const double x12 = 12;

  /// The level pin.
  static const double x14 = 14;

  /// Card badges.
  static const double x18 = 18;

  /// Tooltips.
  static const double x16 = 16;

  /// Chips.
  static const double x20 = 20;

  /// Chips, quest buttons, the claim button.
  static const double x24 = 24;

  /// Panels and primary buttons.
  static const double x30 = 30;
}

abstract final class AppBorders {
  /// The outline every chip and button carries.
  static const double x2 = 2;

  /// The gold frame of the season-over card.
  static const double x3 = 3;

  /// The selection frame around a reward card.
  static const double x4 = 4;
}

abstract final class AppIconSize {
  /// Inline with caption text.
  static const double x28 = 28;

  /// Inline with body text.
  static const double x30 = 30;

  /// The info bar timer.
  static const double x32 = 32;

  /// Buttons and badges.
  static const double x36 = 36;

  /// The "received" double check.
  static const double x48 = 48;

  /// The experience coin on a quest card.
  static const double x88 = 88;

  /// The experience coin on the preview card.
  static const double x96 = 96;
}
