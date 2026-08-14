// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'battle_pass.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BattlePass _$BattlePassFromJson(Map<String, dynamic> json) => _BattlePass(
  seasonId: (json['season_id'] as num?)?.toInt() ?? 0,
  seasonTitle: json['season_title'] as String? ?? '',
  endsAt: (json['ends_at'] as num?)?.toInt() ?? 0,
  level: (json['level'] as num?)?.toInt() ?? 0,
  maxLevel: (json['max_level'] as num?)?.toInt() ?? 0,
  xp: (json['xp'] as num?)?.toInt() ?? 0,
  xpPerLevel: (json['xp_per_level'] as num?)?.toInt() ?? 0,
  premiumOwned: json['premium_owned'] as bool? ?? false,
  claimDeadline: (json['claim_deadline'] as num?)?.toInt() ?? 0,
  selectedLevel: (json['selected_level'] as num?)?.toInt() ?? 1,
  promo: json['promo'] == null ? const Promo() : Promo.fromJson(json['promo'] as Map<String, dynamic>),
  levels:
      (json['levels'] as List<dynamic>?)?.map((e) => Level.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Level>[],
  quests:
      (json['quests'] as List<dynamic>?)?.map((e) => Quest.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Quest>[],
  pendingRewards:
      (json['pending_rewards'] as List<dynamic>?)?.map((e) => Reward.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Reward>[],
);
