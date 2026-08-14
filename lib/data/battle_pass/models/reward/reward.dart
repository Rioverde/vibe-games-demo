import 'package:freezed_annotation/freezed_annotation.dart';

part 'reward.freezed.dart';
part 'reward.g.dart';

/// Card tier — drives the gradient behind the item and the light around it.
enum RewardTier {
  @JsonValue(0)
  common,
  @JsonValue(1)
  rare,
  @JsonValue(2)
  epic,
  @JsonValue(3)
  legendary,
}

@freezed
sealed class Reward with _$Reward {
  const factory Reward({
    /// id of the reward
    @Default(0) int id,

    /// name shown once the reward is selected
    @Default('') String name,

    /// asset key of the item art
    @Default('') String icon,

    /// quantity; 1 draws no "xN" pill
    @Default(1) int amount,

    /// card tier, see [RewardTier]
    @Default(RewardTier.common) RewardTier tier,

    /// lies on the premium track: crown badge instead of a gift
    @Default(false) bool premium,

    /// text behind the "i" next to the name; empty hides the icon
    @Default('') String hint,
  }) = _Reward;

  const Reward._();

  factory Reward.fromJson(Map<String, dynamic> json) => _$RewardFromJson(json);

  factory Reward.mock() => const Reward(id: 1, name: 'Мега пак', icon: 'car', tier: RewardTier.legendary);

  /// A single item shows no quantity pill.
  bool get showsAmount => amount > 1;

  bool get hasHint => hint.isNotEmpty;
}
