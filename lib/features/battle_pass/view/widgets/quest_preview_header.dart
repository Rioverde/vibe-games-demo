import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/quest_progress_chip.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Top strip of the quest preview card: XP icon, reward and progress.
class QuestPreviewHeader extends StatelessWidget {
  const QuestPreviewHeader({required this.quest, required this.radius, super.key});

  final Quest quest;

  /// Corner radius in logical pixels, shared with the card body.
  final double radius;

  @override
  Widget build(BuildContext context) => Container(
    height: context.s(110),
    padding: EdgeInsets.symmetric(horizontal: context.s(AppInsets.x30)),
    decoration: BoxDecoration(
      color: context.colors.panelHeader,
      borderRadius: BorderRadius.vertical(top: Radius.circular(radius)),
    ),
    child: Row(
      children: [
        Assets.icons.xp.image(width: context.s(AppIconSize.x96), height: context.s(AppIconSize.x96)),
        SizedBox(width: context.s(AppInsets.x12)),
        Text(
          context.l10n.xpMultiplier(quest.xpReward),
          style: context.textStyles.body.copyWith(color: context.colors.textPrimary),
        ),
        const Spacer(),
        QuestProgressChip(quest: quest),
      ],
    ),
  );
}
