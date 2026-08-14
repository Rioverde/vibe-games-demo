import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';
import 'package:vibe_games_demo/features/battle_pass/view/components/battle_pass_body.dart';

/// Main battle pass screen — "БП / Главная" in the mockup.
///
/// The cubit is created here rather than registered in DI: it belongs to this
/// route, and the quest screen reuses the same instance through the router.
@RoutePage()
class BattlePassScreen extends StatelessWidget implements AutoRouteWrapper {
  const BattlePassScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => BlocProvider.value(
    value: context.read<BattlePassCubit>(),
    child: this,
  );

  @override
  Widget build(BuildContext context) => Scaffold(
    backgroundColor: context.colors.background,
    body: const BattlePassBody(),
  );
}
