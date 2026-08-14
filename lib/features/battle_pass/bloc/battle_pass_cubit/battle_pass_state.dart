part of 'battle_pass_cubit.dart';

@freezed
sealed class BattlePassState with _$BattlePassState {
  const factory BattlePassState.loading() = BattlePassLoading;

  /// A payload is on screen.
  ///
  /// [busy] covers the follow-up requests that mutate an already visible pass:
  /// buttons lock, but the screen keeps its content instead of collapsing back
  /// to a spinner.
  const factory BattlePassState.loaded({
    required BattlePass pass,
    required BattlePassScenario scenario,
    @Default(false) bool busy,
  }) = BattlePassLoaded;

  const factory BattlePassState.error(String message) = BattlePassError;
}
