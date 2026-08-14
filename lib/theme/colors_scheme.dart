import 'dart:ui';

/// Palette contract the screens read through `context.colors`.
///
/// The battle pass ships dark only, but the contract stays abstract so a light
/// scheme can be registered later without touching a single call site.
abstract class ColorsScheme {
  // Surfaces
  Color get background;
  Color get panel;
  Color get panelHeader;
  Color get chip;
  Color get navBar;
  Color get pill;
  Color get levelPin;

  // Text
  Color get textPrimary;
  Color get textOnAccent;
  Color get promoTitle;

  // Accents
  Color get track;
  Color get claim;

  /// The green a progress figure is written in.
  Color get progress;
  Color get heroGlow;
  Color get ctaGlow;

  /// The green gradient every claim button is filled with, and the paler
  /// label the quest one uses.
  List<Color> get claimGradient;
  List<Color> get questClaimGradient;

  /// The badge on the quest preview card.
  List<Color> get newStickerGradient;
  Color get questClaimLabel;

  /// Plate and label glow of the "collect all" bar.
  Color get trayBar;
  Color get trayBarGlow;

  // Gradients
  List<Color> get ctaGradient;
  List<Color> get premiumGradient;
  List<Color> get seasonTitleGradient;
  List<Color> get bottomShadowGradient;
  List<Color> get questBackdropGradient;

  /// Reward card backgrounds and light spots, indexed by tier.
  List<List<Color>> get tierGradients;
  List<Color> get tierAccents;
}
