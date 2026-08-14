import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/components/vg_countdown_text.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_ring.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/season_title.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Top-left block: level ring, season deadline and season title.
class InfoBar extends StatelessWidget {
  const InfoBar({required this.pass, super.key});

  final BattlePass pass;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisSize: MainAxisSize.min,
    children: [
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
                Assets.icons.timer.image(width: context.s(AppIconSize.x32), height: context.s(AppIconSize.x32)),
                SizedBox(width: context.s(14)),
                VGCountdownText(
                  deadline: pass.endsAtDate,
                  style: context.textStyles.body.copyWith(
                    color: context.colors.textPrimary.withValues(alpha: 0.4),
                  ),
                ),
              ],
            ),
            SizedBox(height: context.s(AppInsets.x8)),
            SeasonTitle(title: pass.seasonTitle),
          ],
        ),
      ),
    ],
  );
}
