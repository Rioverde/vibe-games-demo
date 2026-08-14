import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/utils/battle_pass_actions_mixin.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/claim_button.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_entrance_spec.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// One level of the track: a reward card, its claim button and the lift that
/// marks the opened one.
///
/// Every claimable level carries its own button — the mockup shows two of them
/// side by side, so this is not tied to the selected card.
class TrackLevelCard extends StatelessWidget with BattlePassActionsMixin {
  const TrackLevelCard({
    required this.level,
    required this.pass,
    this.big = false,
    super.key,
  });

  final Level level;
  final BattlePass pass;
  final bool big;

  @override
  Widget build(BuildContext context) {
    final reward = level.preview;
    if (reward == null) return const SizedBox.shrink();

    final selected = pass.selectedLevel == level.number;

    return Center(
      child: AnimatedSlide(
        // The opened card lifts out of the row, so the eye can follow which
        // reward the middle of the screen is showing.
        offset: Offset(0, selected ? -TrackEntranceSpec.selectedLift / RewardCard.smallHeight : 0),
        duration: AppDurations.short,
        curve: Curves.easeOutBack,
        child: RewardCard(
          reward: reward,
          state: level.state,
          selected: selected,
          premiumOwned: pass.premiumOwned,
          big: big,
          onTap: () => selectLevel(context, level.number),
          claimButton: level.isClaimable ? ClaimButton(onTap: () => claim(context, level.number)) : null,
        ),
      ),
    );
  }
}
