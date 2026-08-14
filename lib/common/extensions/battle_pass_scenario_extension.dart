import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';

/// Localized label for the demo state switch.
extension BattlePassScenarioExtension on BattlePassScenario {
  String label(BuildContext context) => switch (this) {
    BattlePassScenario.premiumNotOwned => context.l10n.scenarioPremiumNotOwned,
    BattlePassScenario.rewardAvailable => context.l10n.scenarioRewardAvailable,
    BattlePassScenario.maxLevel => context.l10n.scenarioMaxLevel,
    BattlePassScenario.seasonFinished => context.l10n.scenarioSeasonFinished,
  };
}
