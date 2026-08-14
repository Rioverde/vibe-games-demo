import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibe_games_demo/app/router/router.gr.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/promo_panel.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/quest_preview_card.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/season_finished_card.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// The band between the top bar and the reward track: the two side panels.
///
/// The hero sits on its own layer behind them, so this row only has to place
/// the panels and leave the middle empty.
class BattlePassMiddleRow extends StatelessWidget {
  const BattlePassMiddleRow({required this.pass, required this.busy, super.key});

  final BattlePass pass;
  final bool busy;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(top: context.s(AppLayout.questCardTopInset)),
        child: AnimatedSwitcher(
          duration: AppDurations.short,
          child: pass.isFinished
              ? SeasonFinishedCard(deadline: pass.claimDeadlineDate)
              : QuestPreviewCard(
                  quests: pass.quests,
                  onOpenQuests: () => context.router.push(const QuestsRoute()),
                ),
        ),
      ),
      const Spacer(),
      Padding(
        padding: EdgeInsets.only(top: context.s(AppLayout.promoTopInset)),
        child: PromoPanel(pass: pass, busy: busy),
      ),
    ],
  );
}
