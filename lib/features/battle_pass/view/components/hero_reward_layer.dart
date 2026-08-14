import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/hero_reward.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// The selected reward, drawn on its own layer between the background and the
/// interface.
///
/// In the mockup the hero starts above the info bar row and ends below the top
/// of the reward track, so it cannot live inside the content column without
/// squashing everything around it. Keeping it as a layer also puts the side
/// panels in front of it, which is the stacking the mockup shows.
class HeroRewardLayer extends StatelessWidget {
  const HeroRewardLayer({required this.pass, super.key});

  final BattlePass pass;

  @override
  Widget build(BuildContext context) {
    final selected = pass.selected;
    final reward = selected?.preview;
    if (reward == null) return const SizedBox.shrink();

    return Align(
      // The mockup centres the hero slightly right of the screen middle, clear
      // of the navigation rail.
      alignment: const Alignment(AppLayout.heroAlignmentX + 0.03, -1.2),
      child: Padding(
        padding: EdgeInsets.only(top: context.s(AppLayout.heroTopInset)),
        child: HeroReward(
          reward: reward,
          locked: selected!.isPremium && !pass.premiumOwned,
        ),
      ),
    );
  }
}
