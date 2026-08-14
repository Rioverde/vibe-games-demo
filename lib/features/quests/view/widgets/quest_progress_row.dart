import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';

/// "1 / 3" in the middle of a quest card.
class QuestProgressRow extends StatelessWidget {
  const QuestProgressRow({required this.quest, super.key});

  final Quest quest;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(
        '${quest.progress}',
        style: context.textStyles.h3.copyWith(
          color: quest.isCompleted ? context.colors.claim : context.colors.track,
        ),
      ),
      Text(
        ' / ',
        style: context.textStyles.h3.copyWith(
          color: context.colors.textPrimary.withValues(alpha: 0.4),
        ),
      ),
      Text(
        '${quest.goal}',
        style: context.textStyles.h3.copyWith(color: context.colors.textPrimary),
      ),
    ],
  );
}
