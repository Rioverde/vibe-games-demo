// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quest.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Quest _$QuestFromJson(Map<String, dynamic> json) => _Quest(
  id: (json['id'] as num?)?.toInt() ?? 0,
  text: json['text'] as String? ?? '',
  xpReward: (json['xp_reward'] as num?)?.toInt() ?? 0,
  progress: (json['progress'] as num?)?.toInt() ?? 0,
  goal: (json['goal'] as num?)?.toInt() ?? 0,
  claimed: json['claimed'] as bool? ?? false,
  expiresAt: (json['expires_at'] as num?)?.toInt() ?? 0,
);
