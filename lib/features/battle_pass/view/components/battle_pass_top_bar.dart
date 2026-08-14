import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/components/vg_circle_icon_button.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/info_bar.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';

/// Season info on the left, close button on the right.
class BattlePassTopBar extends StatelessWidget {
  const BattlePassTopBar({required this.pass, super.key});

  final BattlePass pass;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.start,
    // No Spacer next to the Flexible: both would take a flex share, and the
    // part the info bar leaves unused would be dropped instead of pushing the
    // close button to the edge.
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Flexible(child: InfoBar(pass: pass)),
      VGCircleIconButton(
        icon: Assets.icons.close,
        onTap: () => context.router.maybePop(),
      ),
    ],
  );
}
