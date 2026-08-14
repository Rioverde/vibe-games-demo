import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/provider/battle_pass_provider.dart';

void main() {
  late BattlePassProvider provider;

  setUp(() => provider = BattlePassProvider());

  group('scenarios', () {
    test('the default payload has no premium and is neither maxed nor over', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.premiumNotOwned)).data;

      expect(pass.premiumOwned, isFalse);
      expect(pass.isMaxLevel, isFalse);
      expect(pass.isFinished, isFalse);
    });

    test('the max level payload disables the promo button and offers claim all', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.maxLevel)).data;

      expect(pass.isMaxLevel, isTrue);
      expect(pass.promo.ctaEnabled, isFalse);
      expect(pass.promo.claimAll, isTrue);
    });

    test('the finished payload carries a claim deadline', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.seasonFinished)).data;

      expect(pass.isFinished, isTrue);
      expect(pass.claimDeadlineDate.isAfter(pass.endsAtDate), isFalse);
    });

    test('every payload ends on a single big level', () async {
      for (final scenario in BattlePassScenario.values) {
        final pass = (await provider.getBattlePass(scenario)).data;
        expect(pass.levels.where((level) => level.big).length, 1, reason: '$scenario');
        expect(pass.levels.last.big, isTrue, reason: '$scenario');
      }
    });
  });

  group('mutations', () {
    test('claim marks only the requested level', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.rewardAvailable)).data;
      final result = (await provider.claim(pass, 4)).data;

      expect(result.levels.firstWhere((l) => l.number == 4).state, LevelState.claimed);
      expect(result.levels.firstWhere((l) => l.number == 5).state, LevelState.locked);
    });

    test('claimAll leaves nothing claimable', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.maxLevel)).data;
      final result = (await provider.claimAll(pass)).data;

      expect(result.hasUnclaimed, isFalse);
    });

    test('buying premium swaps the promo to selling levels', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.premiumNotOwned)).data;
      final result = (await provider.buyPremium(pass)).data;

      expect(result.premiumOwned, isTrue);
      expect(result.promo.cta, 'Повысить уровень');
    });

    test('buying premium leaves the tray alone', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.premiumNotOwned)).data;
      expect(pass.tray, isNotEmpty);

      final result = (await provider.buyPremium(pass)).data;

      // Figma draws the same tray in the premium-owned frames: it is a pile to
      // collect, not an upsell that a purchase clears away.
      expect(result.tray, pass.tray);
    });

    test('collecting the tray is what empties it', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.premiumNotOwned)).data;

      final result = (await provider.claimPending(pass)).data;

      expect(result.tray, isEmpty);
      expect(result.levels, pass.levels, reason: 'the track is untouched');
    });

    test('the tray never shifts the level numbering', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.premiumNotOwned)).data;

      // Figma pins the track 1..9 next to a tray that carries no pin at all.
      expect(pass.tray, isNotEmpty);
      expect(pass.levels.first.number, 1);
    });

    test('buying a level opens the next reward and resets the ring', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.rewardAvailable)).data;
      final result = (await provider.buyLevel(pass)).data;

      expect(result.level, pass.level + 1);
      expect(result.xp, 0);
      expect(result.levels.firstWhere((l) => l.number == result.level).state, LevelState.available);
    });

    test('buying a level does nothing at the season maximum', () async {
      final pass = (await provider.getBattlePass(BattlePassScenario.maxLevel)).data;
      final result = (await provider.buyLevel(pass)).data;

      expect(result.level, pass.maxLevel);
    });
  });
}
