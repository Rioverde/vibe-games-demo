import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// XP icon, the "Опыт БП" tag and the amount, at the top of a quest card.
class QuestRewardRow extends StatelessWidget {
  const QuestRewardRow({required this.xpReward, super.key});

  final int xpReward;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Assets.icons.xp.image(width: context.s(AppIconSize.x88), height: context.s(AppIconSize.x88)),
      SizedBox(width: context.s(14)),
      Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: context.s(22), vertical: context.s(6)),
              decoration: BoxDecoration(
                color: context.colors.track,
                borderRadius: BorderRadius.circular(context.s(AppRadius.x24)),
              ),
              child: Text(
                context.l10n.questsXpReward,
                style: context.textStyles.caption.copyWith(color: context.colors.textPrimary),
              ),
            ),
            SizedBox(height: context.s(AppInsets.x8)),
            Text(
              context.l10n.xpMultiplier(xpReward),
              style: context.textStyles.body.copyWith(color: context.colors.textPrimary),
            ),
          ],
        ),
      ),
    ],
  );
}
