import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The green button that fills the bottom of a claimable card.
///
/// It sits inside the card rather than hanging off it, and leans with the same
/// angle as the plate — the mockup treats card and button as one shape wrapped
/// by a single selection frame. Only the plate leans: the label stays upright,
/// exactly as the item art does.
class ClaimButton extends StatelessWidget {
  const ClaimButton({this.onTap, super.key});

  /// The button sits inside the card, inset from its edges.
  static const double height = 56;
  static const double radius = 24;
  static const double inset = 12;

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: onTap,
    child: SizedBox(
      height: context.s(ClaimButton.height),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned.fill(
            child: Transform(
              alignment: Alignment.center,
              transform: Matrix4.skewX(RewardCard.lean),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: context.colors.claim,
                  borderRadius: BorderRadius.circular(context.s(ClaimButton.radius)),
                  border: Border.all(
                    color: context.colors.textPrimary.withValues(alpha: 0.4),
                    width: context.s(AppInsets.x2),
                  ),
                ),
              ),
            ),
          ),
          Text(
            context.l10n.battlePassClaim,
            maxLines: 1,
            style: context.textStyles.body.copyWith(color: context.colors.textPrimary),
          ),
        ],
      ),
    ),
  );
}
