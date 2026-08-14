import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_response/battle_pass_response.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';

/// Data access for the battle pass.
///
/// The mutations are what a real backend would own; each of them answers with a
/// fresh payload rather than a patch, so the screen keeps a single source of
/// truth for what it draws.
abstract class BattlePassRepository {
  Future<BattlePassResponse> getBattlePass(BattlePassScenario scenario);

  /// Takes the rewards of one level.
  Future<BattlePassResponse> claim(BattlePass pass, int levelNumber);

  /// Takes everything that is currently claimable.
  Future<BattlePassResponse> claimAll(BattlePass pass);

  /// Takes the experience a finished quest is holding.
  Future<BattlePassResponse> claimQuest(BattlePass pass, int questId);

  /// Takes the rewards waiting in the tray at the head of the track.
  Future<BattlePassResponse> claimPending(BattlePass pass);

  /// Buys the premium track.
  Future<BattlePassResponse> buyPremium(BattlePass pass);

  /// Spends currency for one level.
  Future<BattlePassResponse> buyLevel(BattlePass pass);
}
