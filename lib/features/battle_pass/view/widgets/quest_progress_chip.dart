import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// "3 / 5" — or the double check the mockup shows once the experience has been
/// collected.
///
/// Finishing a quest is not enough for the check: the frame with the
/// "Забрать опыт" button still reads "5 / 5". Only what has been *taken* turns
/// into a tick.
///
/// The figure carries the colour and the goal stays muted, which is the same
/// split the quest list uses.
class QuestProgressChip extends StatelessWidget {
  const QuestProgressChip({required this.quest, super.key});

  final Quest quest;

  @override
  Widget build(BuildContext context) {
    if (quest.claimed) {
      return Assets.icons.received.image(
        width: context.s(AppIconSize.x48),
        height: context.s(AppIconSize.x48),
      );
    }

    final muted = context.textStyles.body.copyWith(
      color: context.colors.textPrimary.withValues(alpha: 0.6),
    );

    return Container(
      width: context.s(112),
      height: context.s(56),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.chip,
        borderRadius: BorderRadius.circular(context.s(AppRadius.x20)),
      ),
      child: Text.rich(
        TextSpan(
          style: muted,
          children: [
            TextSpan(
              text: '${quest.progress}',
              style: context.textStyles.body.copyWith(color: context.colors.progress),
            ),
            TextSpan(text: ' / ${quest.goal}'),
          ],
        ),
      ),
    );
  }
}
