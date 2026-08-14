/// Which canned reply the mocked backend should send.
///
/// This is a *fixture* selector, not app state — it stands in for the payload
/// the server would return. The screen never reads it; it only ever sees a
/// `BattlePass`. See `BattlePassScenarioExtension` for the localized label.
enum BattlePassScenario {
  premiumNotOwned,
  rewardAvailable,
  maxLevel,
  seasonFinished;

  BattlePassScenario get next => BattlePassScenario.values[(index + 1) % BattlePassScenario.values.length];
}
