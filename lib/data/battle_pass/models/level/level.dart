import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';

part 'level.freezed.dart';
part 'level.g.dart';

/// State of a level's reward slot.
///
/// It lives on the level rather than on the reward: a slot may hold a stack of
/// items, but they are all taken with one button.
enum LevelState {
  @JsonValue(0)
  locked,
  @JsonValue(1)
  available,
  @JsonValue(2)
  claimed,
}

@freezed
sealed class Level with _$Level {
  const factory Level({
    /// level number, printed on the pin under the card
    @Default(0) int number,

    /// whether the rewards are locked, claimable or already taken
    @Default(LevelState.locked) LevelState state,

    /// final level of the season — bigger card with a frame
    @Default(false) bool big,

    /// rewards of this level, claimed together
    @Default(<Reward>[]) List<Reward> rewards,
  }) = _Level;

  const Level._();

  factory Level.fromJson(Map<String, dynamic> json) => _$LevelFromJson(json);

  factory Level.mock() => Level(number: 1, rewards: [Reward.mock()]);

  /// The card the collapsed track shows for this level.
  Reward? get preview => rewards.isEmpty ? null : rewards.first;

  /// A locked premium reward is dimmed rather than hidden.
  bool get isPremium => preview?.premium ?? false;

  bool get isClaimable => state == LevelState.available;

  bool get isClaimed => state == LevelState.claimed;

  bool get isLocked => state == LevelState.locked;
}
