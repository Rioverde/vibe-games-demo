import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/components/vg_circle_icon_button.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/left_nav_bar.dart';
import 'package:vibe_games_demo/features/quests/view/components/quests_list.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quest_card.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quests_header.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quests_upsell.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// Layout of the loaded quest screen.
///
/// Same skeleton as the battle pass: rail, then a column whose middle band
/// flexes so the card row never overflows a shorter screen.
class QuestsContent extends StatelessWidget {
  const QuestsContent({required this.pass, super.key});

  final BattlePass pass;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      const LeftNavBar(),
      Expanded(
        child: SafeArea(
          // Horizontal only: the screen is a full-bleed landscape frame, so a
          // top or bottom inset would squeeze the band the mockup measures in
          // fixed units. The left cutout is absorbed by the navigation rail.
          left: false,
          top: false,
          bottom: false,
          child: Padding(
            padding: EdgeInsets.fromLTRB(
              context.s(AppLayout.contentInsetLeft - LeftNavBar.width),
              context.s(30),
              0,
              context.s(60),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // See BattlePassTopBar: a Spacer beside a loose Flexible eats
                  // half the free space and never reaches the edge.
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(child: QuestsHeader(pass: pass)),
                    VGCircleIconButton(
                      icon: Assets.icons.close,
                      onTap: () => context.router.maybePop(),
                    ),
                  ],
                ),
                Expanded(
                  child: Center(
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxHeight: context.s(QuestCard.height)),
                      child: QuestsList(quests: pass.quests),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: QuestsUpsell(premiumOwned: pass.premiumOwned),
                ),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
