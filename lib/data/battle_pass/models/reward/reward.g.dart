// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reward.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Reward _$RewardFromJson(Map<String, dynamic> json) => _Reward(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['name'] as String? ?? '',
  icon: json['icon'] as String? ?? '',
  amount: (json['amount'] as num?)?.toInt() ?? 1,
  tier: $enumDecodeNullable(_$RewardTierEnumMap, json['tier']) ?? RewardTier.common,
  premium: json['premium'] as bool? ?? false,
  hint: json['hint'] as String? ?? '',
);

const _$RewardTierEnumMap = {
  RewardTier.common: 0,
  RewardTier.rare: 1,
  RewardTier.epic: 2,
  RewardTier.legendary: 3,
};
