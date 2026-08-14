import 'dart:ui';

import 'package:injectable/injectable.dart';
import 'package:vibe_games_demo/theme/colors_scheme.dart';
import 'package:vibe_games_demo/theme/theme_colors.dart';

/// The season's dark palette.
@LazySingleton(as: ColorsScheme)
class DarkColorsScheme implements ColorsScheme {
  @override
  Color get background => ThemeColors.screen;
  @override
  Color get panel => ThemeColors.panel;
  @override
  Color get panelHeader => ThemeColors.panelHeader;
  @override
  Color get chip => ThemeColors.chip;
  @override
  Color get navBar => ThemeColors.navBar;
  @override
  Color get pill => ThemeColors.pill;
  @override
  Color get levelPin => ThemeColors.screen;

  @override
  Color get textPrimary => ThemeColors.white;
  @override
  Color get textOnAccent => ThemeColors.darkRed;
  @override
  Color get promoTitle => ThemeColors.gold;

  @override
  Color get track => ThemeColors.red;
  @override
  Color get claim => ThemeColors.green;
  @override
  Color get progress => ThemeColors.progress;
  @override
  Color get heroGlow => ThemeColors.cyan;
  @override
  Color get ctaGlow => ThemeColors.amber;
  @override
  List<Color> get claimGradient => const [ThemeColors.claimTop, ThemeColors.claimBottom];
  @override
  List<Color> get questClaimGradient => const [ThemeColors.questClaimTop, ThemeColors.questClaimBottom];
  @override
  Color get questClaimLabel => ThemeColors.questClaimLabel;
  @override
  List<Color> get newStickerGradient => const [
    ThemeColors.stickerTop,
    ThemeColors.stickerMid,
    ThemeColors.stickerBottom,
  ];
  @override
  Color get trayBar => ThemeColors.amberWash;
  @override
  Color get trayBarGlow => ThemeColors.emberGlow;

  @override
  List<Color> get ctaGradient => const [ThemeColors.goldLight, ThemeColors.goldDeep];
  @override
  List<Color> get premiumGradient => const [ThemeColors.goldLight, ThemeColors.coral];
  @override
  List<Color> get seasonTitleGradient => const [ThemeColors.crimson, ThemeColors.orange];
  @override
  List<Color> get bottomShadowGradient => const [
    ThemeColors.shadowTop,
    ThemeColors.shadowMid,
    ThemeColors.shadowDeep,
  ];
  @override
  List<Color> get questBackdropGradient => const [
    ThemeColors.questTop,
    ThemeColors.questMid,
    ThemeColors.questBottom,
  ];

  @override
  List<List<Color>> get tierGradients => const [
    [ThemeColors.commonTop, ThemeColors.commonMid, ThemeColors.commonBottom],
    [ThemeColors.rareTop, ThemeColors.rareMid, ThemeColors.rareBottom],
    [ThemeColors.epicTop, ThemeColors.epicMid, ThemeColors.epicBottom],
    [ThemeColors.legendaryTop, ThemeColors.legendaryMid, ThemeColors.legendaryBottom],
  ];

  @override
  List<Color> get tierAccents => const [
    ThemeColors.commonAccent,
    ThemeColors.rareAccent,
    ThemeColors.epicAccent,
    ThemeColors.legendaryAccent,
  ];
}
