import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';
import 'package:vibe_games_demo/features/quests/view/components/quests_body.dart';

/// "БП / Задания" — the quest list behind the main screen's "Задания" button.
///
/// It reuses the battle pass cubit provided by the parent route rather than
/// loading its own copy: the quests arrive inside the same payload, and a second
/// source would let the two screens disagree about the player's progress.
@RoutePage()
class QuestsScreen extends StatelessWidget implements AutoRouteWrapper {
  const QuestsScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider.value(
    value: context.read<BattlePassCubit>(),
    child: this,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.background,
    body: const QuestsBody(),
  );
}
