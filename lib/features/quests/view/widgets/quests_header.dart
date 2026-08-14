import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/components/vg_circle_icon_button.dart';
import 'package:vibe_games_demo/common/ui/components/vg_countdown_text.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_ring.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Back button, level ring, refresh timer and the screen title.
class QuestsHeader extends StatelessWidget {
  const QuestsHeader({required this.pass, super.key});

  final BattlePass pass;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
      VGCircleIconButton.small(
        icon: Assets.icons.arrowRight,
        flipHorizontally: true,
        onTap: () => context.router.maybePop(),
      ),
      SizedBox(width: context.s(AppInsets.x24)),
      LevelRing(pass: pass),
      SizedBox(width: context.s(37)),
      Padding(
        padding: EdgeInsets.only(top: context.s(AppInsets.x20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: context.s(AppInsets.x20),
                    vertical: context.s(6),
                  ),
                  decoration: BoxDecoration(
                    color: context.colors.textPrimary.withValues(alpha: 0.12),
                    borderRadius: BorderRadius.circular(context.s(AppRadius.x24)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Assets.icons.timer.image(width: context.s(AppIconSize.x28), height: context.s(AppIconSize.x28)),
                      SizedBox(width: context.s(AppInsets.x12)),
                      VGCountdownText(
                        deadline: pass.endsAtDate,
                        style: context.textStyles.caption.copyWith(
                          color: context.colors.textPrimary.withValues(alpha: 0.8),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(width: context.s(AppInsets.x16)),
                Text(
                  context.l10n.questsRefreshHint,
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary.withValues(alpha: 0.5),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.s(AppInsets.x8)),
            Text(
              context.l10n.questsTitle,
              style: context.textStyles.h1.copyWith(
                color: context.colors.textPrimary.withValues(alpha: 0.85),
              ),
            ),
          ],
        ),
      ),
    ],
  );
}
