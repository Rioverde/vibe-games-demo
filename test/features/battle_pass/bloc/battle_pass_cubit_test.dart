import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/provider/battle_pass_provider.dart';
import 'package:vibe_games_demo/data/battle_pass/repository/battle_pass_repository.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/l10n/gen/app_localizations_ru.dart';

void main() {
  setUpAll(() {
    // The cubit resolves its repository through getIt, so the container has to
    // be populated the way `configureDependencies` would in the app.
    getIt.registerLazySingleton<BattlePassRepository>(BattlePassProvider.new);
  });

  tearDownAll(getIt.reset);

  BattlePassCubit build() => BattlePassCubit(locale: AppLocalizationsRu());

  /// Waits out the constructor's own load before acting.
  Future<void> settle(BattlePassCubit cubit) async => cubit.stream.firstWhere((state) => state is BattlePassLoaded);

  group('load', () {
    blocTest<BattlePassCubit, BattlePassState>(
      'lands on a payload without being asked',
      build: build,
      wait: const Duration(milliseconds: 500),
      verify: (cubit) => expect(cubit.state, isA<BattlePassLoaded>()),
    );

    blocTest<BattlePassCubit, BattlePassState>(
      'derives "premium not owned" from the payload alone',
      build: build,
      act: settle,
      verify: (cubit) {
        final pass = (cubit.state as BattlePassLoaded).pass;
        expect(pass.premiumOwned, isFalse);
        expect(pass.isMaxLevel, isFalse);
        expect(pass.isFinished, isFalse);
      },
    );

    blocTest<BattlePassCubit, BattlePassState>(
      'switching scenario swaps the payload',
      build: build,
      act: (cubit) async {
        await settle(cubit);
        await cubit.nextScenario();
      },
      verify: (cubit) {
        final state = cubit.state as BattlePassLoaded;
        expect(state.scenario, BattlePassScenario.rewardAvailable);
        expect(state.pass.premiumOwned, isTrue);
      },
    );
  });

  group('claim', () {
    blocTest<BattlePassCubit, BattlePassState>(
      'takes an available level',
      build: build,
      act: (cubit) async {
        await cubit.load(BattlePassScenario.rewardAvailable);
        await cubit.claim(4);
      },
      verify: (cubit) {
        final pass = (cubit.state as BattlePassLoaded).pass;
        expect(pass.levels.firstWhere((l) => l.number == 4).state, LevelState.claimed);
      },
    );

    blocTest<BattlePassCubit, BattlePassState>(
      'ignores a level that is not claimable',
      build: build,
      act: (cubit) async {
        await cubit.load(BattlePassScenario.rewardAvailable);
        await cubit.claim(9);
      },
      verify: (cubit) {
        final pass = (cubit.state as BattlePassLoaded).pass;
        expect(pass.levels.firstWhere((l) => l.number == 9).state, LevelState.locked);
      },
    );

    blocTest<BattlePassCubit, BattlePassState>(
      'claimAll clears every claimable level',
      build: build,
      act: (cubit) async {
        await cubit.load(BattlePassScenario.maxLevel);
        await cubit.claimAll();
      },
      verify: (cubit) => expect((cubit.state as BattlePassLoaded).pass.hasUnclaimed, isFalse),
    );
  });

  group('purchases', () {
    blocTest<BattlePassCubit, BattlePassState>(
      'buying premium flips the promo panel to selling levels',
      build: build,
      act: (cubit) async {
        await cubit.load();
        await cubit.buyPremium();
      },
      verify: (cubit) {
        final pass = (cubit.state as BattlePassLoaded).pass;
        expect(pass.premiumOwned, isTrue);
        expect(pass.promo.cta, 'Повысить уровень');
      },
    );

    blocTest<BattlePassCubit, BattlePassState>(
      'buying a level does nothing at the season maximum',
      build: build,
      act: (cubit) async {
        await cubit.load(BattlePassScenario.maxLevel);
        await cubit.buyLevel();
      },
      verify: (cubit) {
        final pass = (cubit.state as BattlePassLoaded).pass;
        expect(pass.level, pass.maxLevel);
      },
    );
  });

  group('after close', () {
    test('a tap that lands while the screen is going away is ignored', () async {
      final cubit = build();
      await cubit.stream.firstWhere((state) => state is BattlePassLoaded);
      await cubit.close();

      // No throw: bloc would otherwise report "cannot emit new states".
      expect(() => cubit.selectLevel(7), returnsNormally);
    });

    test('a reply that comes back after close is dropped', () async {
      final cubit = build();
      await cubit.stream.firstWhere((state) => state is BattlePassLoaded);

      final pending = cubit.buyPremium();
      await cubit.close();

      await expectLater(pending, completes);
    });
  });

  group('selection', () {
    blocTest<BattlePassCubit, BattlePassState>(
      'selecting a level swaps the hero reward',
      build: build,
      act: (cubit) async {
        await cubit.load();
        cubit.selectLevel(7);
      },
      verify: (cubit) {
        final pass = (cubit.state as BattlePassLoaded).pass;
        expect(pass.selectedLevel, 7);
        expect(pass.selected?.number, 7);
      },
    );

    blocTest<BattlePassCubit, BattlePassState>(
      're-selecting the same level emits nothing new',
      build: build,
      act: (cubit) async {
        await cubit.load();
        final before = cubit.state as BattlePassLoaded;
        cubit.selectLevel(before.pass.selectedLevel);

        // Same object, not just an equal one: nothing was emitted.
        expect(identical(cubit.state, before), isTrue);
      },
    );
  });
}
