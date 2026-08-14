import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/claim_button.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
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

  Future<void> pumpCard(
    WidgetTester tester, {
    required VoidCallback onClaim,
    required VoidCallback onSelect,
  }) => tester.pumpWidget(
    MaterialApp(
      locale: const Locale('ru'),
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: Scaffold(
        body: Center(
          child: RewardCard(
            reward: const Reward(id: 1, name: 'Мега пак', icon: 'car'),
            state: LevelState.available,
            selected: true,
            premiumOwned: true,
            onTap: onSelect,
            claimButton: ClaimButton(onTap: onClaim),
          ),
        ),
      ),
    ),
  );

  testWidgets('tapping the claim button claims instead of selecting', (tester) async {
    var claimed = 0;
    var selected = 0;

    await pumpCard(tester, onClaim: () => claimed++, onSelect: () => selected++);
    await tester.tap(find.byType(ClaimButton));
    await tester.pumpAndSettle();

    expect(claimed, 1, reason: 'the button must handle its own tap');
    expect(selected, 0, reason: 'the card underneath must not steal it');
  });

  testWidgets('tapping the card outside the button still selects it', (tester) async {
    var claimed = 0;
    var selected = 0;

    await pumpCard(tester, onClaim: () => claimed++, onSelect: () => selected++);
    final card = tester.getRect(find.byType(RewardCard));
    await tester.tapAt(Offset(card.center.dx, card.top + 12));
    await tester.pumpAndSettle();

    expect(selected, 1);
    expect(claimed, 0);
  });
}
