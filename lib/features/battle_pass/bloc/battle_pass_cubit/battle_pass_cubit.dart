import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_response/battle_pass_response.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/data/battle_pass/repository/battle_pass_repository.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/l10n/gen/app_localizations.dart';

part 'battle_pass_cubit.freezed.dart';
part 'battle_pass_state.dart';

/// Owns the battle pass screen and the quest screen behind it.
///
/// The cubit deliberately holds no "which of the four mockups is this" flag.
/// Every visual state — premium bought or not, reward waiting, max level,
/// season over — is derived from the payload, so the screen cannot end up in a
/// combination the backend would never send.
class BattlePassCubit extends Cubit<BattlePassState> {
  BattlePassCubit({required this.locale}) : super(const BattlePassState.loading()) {
    _repository = getIt<BattlePassRepository>();
    load();
  }

  late final BattlePassRepository _repository;
  final AppLocalizations locale;

  BattlePassScenario _scenario = BattlePassScenario.premiumNotOwned;

  Future<void> load([BattlePassScenario? scenario]) async {
    _scenario = scenario ?? _scenario;
    try {
      _emit(const BattlePassState.loading());
      final response = await _repository.getBattlePass(_scenario);
      _emit(BattlePassState.loaded(pass: response.data, scenario: _scenario));
    } catch (e) {
      _emit(BattlePassState.error(locale.errorMessage));
    }
  }

  /// Cycles through the mocked payloads. This is the demo hook that stands in
  /// for the backend sending a different reply — see README.
  Future<void> nextScenario() => load(_scenario.next);

  /// Opens a level in the middle of the screen.
  void selectLevel(int number) {
    final current = state;
    if (current is! BattlePassLoaded || current.pass.selectedLevel == number) return;
    _emit(current.copyWith(pass: current.pass.copyWith(selectedLevel: number)));
  }

  /// Takes the rewards of one level. Ignored unless that level is claimable —
  /// a stale tap from a running animation must not double-claim.
  Future<void> claim(int levelNumber) => _mutate((pass) {
    final target = pass.levels.where((level) => level.number == levelNumber).firstOrNull;
    if (target == null || !target.isClaimable) return null;
    return _repository.claim(pass, levelNumber);
  });

  Future<void> claimAll() => _mutate((pass) => pass.hasUnclaimed ? _repository.claimAll(pass) : null);

  /// Takes the experience a finished quest is holding.
  Future<void> claimQuest(int questId) => _mutate((pass) {
    final quest = pass.quests.where((item) => item.id == questId).firstOrNull;
    if (quest == null || !quest.isCompleted || quest.claimed) return null;
    return _repository.claimQuest(pass, questId);
  });

  /// Collects the tray at the head of the track.
  Future<void> claimPending() => _mutate((pass) => pass.tray.isEmpty ? null : _repository.claimPending(pass));

  Future<void> buyPremium() => _mutate((pass) => pass.premiumOwned ? null : _repository.buyPremium(pass));

  Future<void> buyLevel() => _mutate((pass) => pass.isMaxLevel ? null : _repository.buyLevel(pass));

  /// Runs a request against the visible pass while keeping it on screen.
  ///
  /// Returning `null` from [action] means "nothing to do" and leaves the state
  /// untouched, so guard clauses do not have to emit a busy/idle round trip.
  Future<void> _mutate(Future<BattlePassResponse>? Function(BattlePass pass) action) async {
    final current = state;
    if (current is! BattlePassLoaded || current.busy) return;

    final request = action(current.pass);
    if (request == null) return;

    _emit(current.copyWith(busy: true));
    try {
      final response = await request;
      _emit(current.copyWith(pass: response.data, busy: false));
    } catch (e) {
      _emit(BattlePassState.error(locale.errorMessage));
    }
  }

  /// Emits only while the cubit is alive.
  ///
  /// Requests outlive the screen: a tap can land as the route is going away, or
  /// an in-flight reply can come back after the scope was torn down. Bloc turns
  /// either into "cannot emit new states after calling close", so the guard
  /// lives in one place instead of at every call site.
  void _emit(BattlePassState state) {
    if (isClosed) return;
    emit(state);
  }
}
