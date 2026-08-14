import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_games_demo/common/ui/components/vg_error_view.dart';
import 'package:vibe_games_demo/common/ui/components/vg_loader.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';
import 'package:vibe_games_demo/features/quests/view/components/quests_content.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quests_background.dart';

/// Wires the shared cubit state to the quest layout.
class QuestsBody extends StatelessWidget {
  const QuestsBody({super.key});

  @override
  Widget build(BuildContext context) => BlocBuilder<BattlePassCubit, BattlePassState>(
    builder: (context, state) => Stack(
      fit: StackFit.expand,
      children: [
        const QuestsBackground(),
        state.maybeMap(
          loaded: (state) => QuestsContent(pass: state.pass),
          error: (state) => VGErrorView(message: state.message),
          orElse: () => const VGLoader(),
        ),
      ],
    ),
  );
}
