import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/data/battle_pass/provider/battle_pass_provider.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_pin.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_track.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_rail_segment.dart';
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

  testWidgets('the track is on screen and fully faded in once it settles', (tester) async {
    tester.view
      ..physicalSize = const Size(2622, 1206)
      ..devicePixelRatio = 3;
    addTearDown(tester.view.reset);

    final pass = (await BattlePassProvider().getBattlePass(BattlePassScenario.premiumNotOwned)).data;

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        home: Scaffold(body: RewardTrack(pass: pass)),
      ),
    );
    // Explicit frames: pumpAndSettle would hang if anything keeps scheduling.
    await tester.pump();
    await tester.pump(const Duration(seconds: 2));

    expect(find.byType(RewardCard), findsWidgets, reason: 'cards must be built');
    expect(find.byType(LevelPin), findsWidgets, reason: 'pins must be built');
    expect(find.byType(TrackRailSegment), findsWidgets, reason: 'the rail must be built');

    // The entrance animation must not leave the row invisible.
    final faded = tester.widgetList<Opacity>(find.byType(Opacity)).where((o) => o.opacity < 1);
    expect(faded, isEmpty, reason: 'every slot should have finished fading in');

    // The rail must have real height: a DecoratedBox with no child collapses
    // to nothing under loose constraints.
    final rail = tester.getRect(find.byType(TrackRailSegment).first);
    expect(rail.height, greaterThan(0));
    expect(rail.width, greaterThan(rail.height), reason: 'it is a horizontal rail');
  });
}
