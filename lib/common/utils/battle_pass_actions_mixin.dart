import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';

/// Shared access to the battle pass actions.
///
/// Several widgets across both screens trigger the same handful of intents.
/// Routing them through one mixin keeps `context.read<...>()` out of the widget
/// bodies and gives every call site the same names.
mixin BattlePassActionsMixin {
  BattlePassCubit cubit(BuildContext context) => context.read<BattlePassCubit>();

  void selectLevel(BuildContext context, int number) => cubit(context).selectLevel(number);

  Future<void> claim(BuildContext context, int levelNumber) => cubit(context).claim(levelNumber);

  Future<void> claimAll(BuildContext context) => cubit(context).claimAll();

  Future<void> claimPending(BuildContext context) => cubit(context).claimPending();

  Future<void> claimQuest(BuildContext context, int questId) => cubit(context).claimQuest(questId);

  Future<void> buyPremium(BuildContext context) => cubit(context).buyPremium();

  Future<void> buyLevel(BuildContext context) => cubit(context).buyLevel();

  Future<void> nextScenario(BuildContext context) => cubit(context).nextScenario();
}
