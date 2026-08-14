import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vibe_games_demo/common/ui/components/vg_error_view.dart';
import 'package:vibe_games_demo/common/ui/components/vg_loader.dart';
import 'package:vibe_games_demo/features/battle_pass/bloc/battle_pass_cubit/battle_pass_cubit.dart';
import 'package:vibe_games_demo/features/battle_pass/view/components/battle_pass_content.dart';
import 'package:vibe_games_demo/features/battle_pass/view/components/hero_reward_layer.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/battle_pass_background.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/left_nav_bar.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/scenario_switch.dart';

/// Wires the cubit state to the battle pass layout.
class BattlePassBody extends StatelessWidget {
  const BattlePassBody({super.key});

  /// The demo control sits in the empty band above the hero, clear of the UI.
  static const Alignment scenarioSwitchAlignment = Alignment(0, -0.94);

  @override
  Widget build(BuildContext context) => BlocBuilder<BattlePassCubit, BattlePassState>(
    builder: (context, state) => Stack(
      fit: StackFit.expand,
      children: [
        BattlePassBackground(
          promoArt: state.maybeMap(loaded: (state) => state.pass.promo.art, orElse: () => null),
        ),
        state.maybeMap(
          loaded: (state) => HeroRewardLayer(pass: state.pass),
          orElse: () => const SizedBox.shrink(),
        ),
        state.maybeMap(
          loaded: (state) => BattlePassContent(pass: state.pass, busy: state.busy),
          error: (state) => VGErrorView(message: state.message),
          // The rail stays put while the payload is on its way, so the screen
          // reads as loading rather than as an empty background.
          orElse: () => const Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              LeftNavBar(),
              Expanded(child: VGLoader()),
            ],
          ),
        ),
        state.maybeMap(
          loaded: (state) => Align(
            alignment: scenarioSwitchAlignment,
            child: ScenarioSwitch(scenario: state.scenario),
          ),
          orElse: () => const SizedBox.shrink(),
        ),
      ],
    ),
  );
}
