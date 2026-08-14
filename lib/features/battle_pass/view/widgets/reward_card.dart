import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/extensions/reward_tier_extension.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_skewed_card.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/claim_button.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_amount_pill.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card_art.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card_glow.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_selection_frame.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_sticker.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// One reward on the track.
///
/// The same widget draws the small track cards and the enlarged final one — the
/// mockup keeps every proportion between them, so a size flag is enough and
/// there is no second copy of this layout to keep in sync.
class RewardCard extends StatelessWidget {
  const RewardCard({
    required this.reward,
    required this.state,
    required this.selected,
    required this.premiumOwned,
    this.big = false,
    this.onTap,
    this.claimButton,
    super.key,
  });

  /// Plate size in design units, small and enlarged.
  static const double smallWidth = 200;
  static const double smallHeight = 184;
  static const double bigWidth = 242;
  static const double bigHeight = 220;

  /// How far the plate leans: 26 units left over its 184-unit height.
  /// Shared with everything that has to lean with it.
  static const double lean = -26 / 184;

  final Reward reward;
  final LevelState state;
  final bool selected;

  /// Kept for the crown badge: a premium reward stays at full brightness on a
  /// free account, because the mockup uses it to sell the pass.
  final bool premiumOwned;

  final bool big;
  final VoidCallback? onTap;

  /// Sits along the bottom edge of the plate when the level is claimable. The
  /// mockup wraps card and button in one selection frame, so the button belongs
  /// inside the card rather than stacked under it.
  final Widget? claimButton;

  bool get _claimed => state == LevelState.claimed;

  /// Only what the player already took goes grey. Locked rewards — premium
  /// included — stay bright, which is how the mockup advertises them.
  bool get _dimmed => _claimed;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: onTap,
    scale: 0.97,
    child: VGSkewedCard(
      width: big ? RewardCard.bigWidth : RewardCard.smallWidth,
      height: big ? RewardCard.bigHeight : RewardCard.smallHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: reward.tier.gradient(context),
        ),
      ),
      // Belongs to the surface, so it leans and gets cut with it instead of
      // stopping on a vertical line partway across the leaning plate.
      plate: RewardCardGlow(color: reward.tier.accent(context), dimmed: _dimmed),
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned.fill(
            child: RewardCardArt(reward: reward, dimmed: _dimmed, big: big),
          ),
          if (reward.showsAmount)
            Positioned(
              right: context.s(AppInsets.x16),
              // Rides above the claim button when there is one: the mockup keeps
              // the count readable instead of tucking it behind the button.
              bottom: context.s(
                claimButton == null ? AppInsets.x12 : ClaimButton.inset + ClaimButton.height + AppInsets.x8,
              ),
              child: RewardAmountPill(amount: reward.amount),
            ),
          Positioned(
            left: context.s(big ? 26 : 26),
            top: context.s(10),
            child: RewardSticker(
              icon: reward.premium ? Assets.icons.premium : Assets.icons.gift,
              gradient: reward.premium ? context.colors.premiumGradient : null,
            ),
          ),
          if (_claimed)
            Positioned(
              right: context.s(big ? 12 : 4),
              top: context.s(-6),
              child: RewardSticker(icon: Assets.icons.received, transparent: true),
            ),
          if (claimButton != null)
            Positioned(
              left: context.s(ClaimButton.inset - 8),
              right: context.s(ClaimButton.inset + 5),
              bottom: context.s(ClaimButton.inset),
              child: claimButton!,
            ),
          if (selected)
            Positioned.fill(
              // Claimable selection reads green like its claim button; anything
              // else borrows the tier accent.
              child: RewardSelectionFrame(
                color: state == LevelState.available ? context.colors.claim : reward.tier.accent(context),
              ),
            ),
        ],
      ),
    ),
  );
}
