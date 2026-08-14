import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/common/ui/components/vg_circle_icon_button.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/components/battle_pass_top_bar.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';
import 'package:vibe_games_demo/theme/colors_scheme.dart';
import 'package:vibe_games_demo/theme/dark_colors_scheme.dart';
import 'package:vibe_games_demo/theme/text_style.dart';

void main() {
  setUpAll(() {
    getIt
      ..registerLazySingleton<ColorsScheme>(DarkColorsScheme.new)
      ..registerLazySingleton<AppTextStyles>(AppTextStyles.new)
      ..registerLazySingleton<BattlePassTrackService>(BattlePassTrackService.new);
  });

  tearDownAll(getIt.reset);

  testWidgets('the close button sits against the trailing edge', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        locale: Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(
          body: BattlePassTopBar(
            pass: BattlePass(seasonTitle: 'Дай пять!', level: 2, maxLevel: 10, xpPerLevel: 1600),
          ),
        ),
      ),
    );

    final row = tester.getRect(find.byType(BattlePassTopBar));
    final button = tester.getRect(find.byType(VGCircleIconButton));

    // A Spacer beside a loose Flexible would strand the button mid-row.
    expect(button.right, closeTo(row.right, 0.5));
  });
}
