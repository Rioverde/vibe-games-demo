import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';

part 'battle_pass_response.freezed.dart';
part 'battle_pass_response.g.dart';

@freezed
sealed class BattlePassResponse with _$BattlePassResponse {
  const factory BattlePassResponse({
    /// battle pass payload
    @Default(BattlePass()) BattlePass data,
  }) = _BattlePassResponse;

  factory BattlePassResponse.fromJson(Map<String, dynamic> json) => _$BattlePassResponseFromJson(json);

  factory BattlePassResponse.mock() => BattlePassResponse(data: BattlePass.mock());
}
