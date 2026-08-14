import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/extensions/battle_pass_scenario_extension.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/common/utils/battle_pass_actions_mixin.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Demo-only switch between the mocked payloads.
///
/// The task asks for a way to flip the screen between its states. It is done
/// here as an explicit swap of the *server reply* rather than a debug flag
/// inside the cubit, so the production path stays the only path: the screen
/// still just renders whatever pass it was handed.
class ScenarioSwitch extends StatelessWidget with BattlePassActionsMixin {
  const ScenarioSwitch({required this.scenario, super.key});

  final BattlePassScenario scenario;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: () => nextScenario(context),
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: context.s(28), vertical: context.s(10)),
      decoration: BoxDecoration(
        color: context.colors.pill.withValues(alpha: 0.8),
        borderRadius: BorderRadius.circular(context.s(AppRadius.x24)),
        border: Border.all(
          color: context.colors.textPrimary.withValues(alpha: 0.2),
          width: context.s(AppInsets.x2),
        ),
      ),
      child: Text(
        context.l10n.scenarioSwitchLabel(scenario.label(context)),
        style: context.textStyles.caption.copyWith(
          color: context.colors.textPrimary.withValues(alpha: 0.75),
        ),
      ),
    ),
  );
}
