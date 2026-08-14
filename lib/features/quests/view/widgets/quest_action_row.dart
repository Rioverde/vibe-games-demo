import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Bottom row of a quest card: the action button and the help square.
class QuestActionRow extends StatelessWidget {
  const QuestActionRow({required this.done, this.onTap, super.key});

  /// A finished quest keeps its place and greys out instead of disappearing —
  /// otherwise the list would reshuffle under the player's finger.
  final bool done;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      Expanded(
        child: VGPressable(
          onTap: onTap,
          child: Container(
            height: context.s(74),
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: done ? context.colors.textPrimary.withValues(alpha: 0.12) : context.colors.track,
              borderRadius: BorderRadius.circular(context.s(AppRadius.x24)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (done) ...[
                  Assets.icons.received.image(width: context.s(AppIconSize.x36), height: context.s(AppIconSize.x36)),
                  SizedBox(width: context.s(AppInsets.x12)),
                ],
                Text(
                  done ? context.l10n.questsDone : context.l10n.questsGo,
                  style: context.textStyles.body.copyWith(
                    color: done ? context.colors.textPrimary.withValues(alpha: 0.5) : context.colors.textPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      SizedBox(width: context.s(14)),
      Container(
        width: context.s(74),
        height: context.s(74),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.textPrimary.withValues(alpha: 0.12),
          borderRadius: BorderRadius.circular(context.s(AppRadius.x24)),
        ),
        child: Text(
          '?',
          style: context.textStyles.body.copyWith(
            color: context.colors.textPrimary.withValues(alpha: 0.6),
          ),
        ),
      ),
    ],
  );
}
