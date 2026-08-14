// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'level.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Level _$LevelFromJson(Map<String, dynamic> json) => _Level(
  number: (json['number'] as num?)?.toInt() ?? 0,
  state: $enumDecodeNullable(_$LevelStateEnumMap, json['state']) ?? LevelState.locked,
  big: json['big'] as bool? ?? false,
  rewards:
      (json['rewards'] as List<dynamic>?)?.map((e) => Reward.fromJson(e as Map<String, dynamic>)).toList() ??
      const <Reward>[],
);

const _$LevelStateEnumMap = {
  LevelState.locked: 0,
  LevelState.available: 1,
  LevelState.claimed: 2,
};
