import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/components/vg_cta_button.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/common/utils/battle_pass_actions_mixin.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/promo_cta_icon.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/promo_disabled_plate.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Right-hand offer: buy the pass, buy a level, or nothing left to buy.
///
/// One widget for all three because the payload models them as one block — see
/// `Promo` in docs/data_schema.md.
class PromoPanel extends StatelessWidget with BattlePassActionsMixin {
  const PromoPanel({required this.pass, required this.busy, super.key});

  /// Column width, and the width of the artwork behind it.
  static const double width = 400;
  static const double artWidth = 605;

  final BattlePass pass;

  /// A request is in flight — the buttons lock without the screen collapsing.
  final bool busy;

  @override
  Widget build(BuildContext context) {
    final promo = pass.promo;

    return SizedBox(
      width: context.s(PromoPanel.width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            promo.title,
            textAlign: TextAlign.center,
            style: context.textStyles.h3.copyWith(color: context.colors.promoTitle),
          ),
          SizedBox(height: context.s(AppInsets.x8)),
          // Flexible so a long description gives way instead of overflowing
          // the band between the info bar and the reward track.
          Flexible(
            child: Text(
              promo.subtitle,
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: context.textStyles.caption.copyWith(
                color: context.colors.textPrimary.withValues(alpha: 0.7),
              ),
            ),
          ),
          SizedBox(height: context.s(27)),
          if (promo.ctaEnabled)
            VGCtaButton(
              label: promo.cta,
              icon: PromoCtaIcon(art: promo.art),
              onTap: busy ? null : () => pass.premiumOwned ? buyLevel(context) : buyPremium(context),
            )
          else
            PromoDisabledPlate(text: promo.ctaDisabledText),
          if (promo.claimAll) ...[
            SizedBox(height: context.s(AppInsets.x16)),
            VGCtaButton(
              label: context.l10n.battlePassClaimAll,
              color: context.colors.claim,
              onTap: busy ? null : () => claimAll(context),
            ),
          ],
        ],
      ),
    );
  }
}
