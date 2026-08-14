import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quest_action_row.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quest_card_divider.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quest_progress_row.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quest_reward_row.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// One quest in the list.
class QuestCard extends StatelessWidget {
  const QuestCard({required this.quest, this.onAction, super.key});

  /// Card size in design units.
  static const double width = 400;
  static const double height = 440;

  final Quest quest;
  final VoidCallback? onAction;

  @override
  Widget build(BuildContext context) {
    final done = quest.isCompleted;

    return SizedBox(
      width: context.s(QuestCard.width),
      child: Container(
        padding: EdgeInsets.all(context.s(AppInsets.x30)),
        decoration: BoxDecoration(
          color: context.colors.pill.withValues(alpha: 0.55),
          borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            QuestRewardRow(xpReward: quest.xpReward),
            SizedBox(height: context.s(22)),
            const QuestCardDivider(),
            SizedBox(height: context.s(18)),
            QuestProgressRow(quest: quest),
            SizedBox(height: context.s(18)),
            Text(
              quest.text,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.caption.copyWith(
                color: context.colors.textPrimary.withValues(alpha: done ? 0.35 : 0.75),
              ),
            ),
            SizedBox(height: context.s(AppInsets.x24)),
            QuestActionRow(done: done, onTap: onAction),
          ],
        ),
      ),
    );
  }
}
