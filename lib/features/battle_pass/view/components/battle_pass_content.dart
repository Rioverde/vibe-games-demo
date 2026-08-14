import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/components/battle_pass_middle_row.dart';
import 'package:vibe_games_demo/features/battle_pass/view/components/battle_pass_top_bar.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/left_nav_bar.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_track.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// Layout of the loaded battle pass screen.
///
/// Built from real constraints rather than absolute coordinates: the rail takes
/// its width, the track takes its height, and the middle band gets whatever is
/// left. That is what keeps the screen honest on a device whose aspect ratio is
/// not exactly the 2320×1080 of the mockup.
class BattlePassContent extends StatelessWidget {
  const BattlePassContent({required this.pass, required this.busy, super.key});

  final BattlePass pass;

  /// A request is in flight — buttons lock without the screen collapsing.
  final bool busy;

  @override
  Widget build(BuildContext context) => Row(
    crossAxisAlignment: CrossAxisAlignment.stretch,
    children: [
      // Full bleed: the rail carries the display cutout in the mockup, and its
      // own contents keep clear of it.
      const LeftNavBar(),
      Expanded(
        child: Padding(
          padding: EdgeInsets.fromLTRB(
            context.s(AppLayout.contentInsetLeft - LeftNavBar.width),
            context.s(AppLayout.contentInsetTop),
            context.s(AppLayout.contentInsetRight),
            context.s(AppLayout.contentInsetBottom),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(
                height: context.s(AppLayout.topBarHeight),
                child: BattlePassTopBar(pass: pass),
              ),
              Flexible(
                child: BattlePassMiddleRow(pass: pass, busy: busy),
              ),
              ConstrainedBox(
                constraints: BoxConstraints(maxHeight: context.s(AppLayout.trackHeight)),
                child: RewardTrack(pass: pass),
              ),
            ],
          ),
        ),
      ),
    ],
  );
}
