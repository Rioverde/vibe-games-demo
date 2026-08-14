import 'package:flutter/material.dart';

/// Raw palette lifted from the Figma frames.
///
/// Nothing outside the color schemes should reference these directly — screens
/// read colors through `context.colors`.
abstract final class ThemeColors {
  static const Color screen = Color(0xFF2D2E34);
  static const Color panel = Color(0xFF212331);
  static const Color panelHeader = Color(0xFF353847);
  static const Color chip = Color(0xFF232429);
  static const Color navBar = Color(0xFF151727);
  static const Color pill = Color(0xFF18191F);

  static const Color white = Color(0xFFE9E9F3);
  static const Color darkRed = Color(0xFF3C0B0B);
  static const Color gold = Color(0xFFFFD149);

  /// The badge on the quest preview card.
  static const Color stickerTop = Color(0xFFFFA34E);
  static const Color stickerMid = Color(0xFFFFC847);
  static const Color stickerBottom = Color(0xFFFF7B5F);

  static const Color red = Color(0xFFEF4029);

  /// The warm wash behind the "collect all" bar, and the glow on its label.
  static const Color amberWash = Color(0xFFE29432);
  static const Color emberGlow = Color(0xFFFF5C00);
  static const Color green = Color(0xFF56C568);

  /// The green a progress figure is written in.
  static const Color progress = Color(0xFF4CAF6C);

  /// The green "claim" gradients and the label the quest button carries.
  static const Color claimTop = Color(0xFF56B877);
  static const Color claimBottom = Color(0xFF449660);
  static const Color questClaimTop = Color(0xFF55B675);
  static const Color questClaimBottom = Color(0xFF449761);
  static const Color questClaimLabel = Color(0xFF68C286);
  static const Color cyan = Color(0xFF8BFFFF);
  static const Color ember = Color(0xFFE23600);
  static const Color amber = Color(0xFFFF8A00);

  // Call-to-action gradient
  static const Color goldLight = Color(0xFFEFCB4C);
  static const Color goldDeep = Color(0xFFDE8029);
  static const Color coral = Color(0xFFF6743C);

  // Season title gradient
  static const Color crimson = Color(0xFFD63A26);
  static const Color orange = Color(0xFFEF6429);

  // Bottom vignette
  static const Color shadowTop = Color(0xFF460D06);
  static const Color shadowMid = Color(0xFF360D03);
  static const Color shadowDeep = Color(0xFF220402);

  // Reward tiers
  static const Color commonTop = Color(0xFF29292C);
  static const Color commonMid = Color(0xFF2E2E31);
  static const Color commonBottom = Color(0xFF424345);
  static const Color commonAccent = Color(0xFF737479);

  static const Color rareTop = Color(0xFF222431);
  static const Color rareMid = Color(0xFF1F3351);
  static const Color rareBottom = Color(0xFF265374);
  static const Color rareAccent = Color(0xFF36B680);

  static const Color epicTop = Color(0xFF2C232A);
  static const Color epicMid = Color(0xFF4A2442);
  static const Color epicBottom = Color(0xFF611163);
  static const Color epicAccent = Color(0xFFEE3460);

  static const Color legendaryTop = Color(0xFF2C1B16);
  static const Color legendaryMid = Color(0xFF5A2410);
  static const Color legendaryBottom = Color(0xFF8A2E0C);
  static const Color legendaryAccent = Color(0xFFFF7A2B);

  // Quest screen backdrop
  static const Color questTop = Color(0xFF3B1220);
  static const Color questMid = Color(0xFF7A2412);
  static const Color questBottom = Color(0xFFD24A16);
}
