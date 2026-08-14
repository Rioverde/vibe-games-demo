import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/components/vg_cta_button.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/common/utils/battle_pass_actions_mixin.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The upgrade nudge at the bottom. With the premium already owned there is
/// nothing to sell, so it becomes a plain progress note.
class QuestsUpsell extends StatelessWidget with BattlePassActionsMixin {
  const QuestsUpsell({required this.premiumOwned, super.key});

  final bool premiumOwned;

  @override
  Widget build(BuildContext context) {
    if (premiumOwned) {
      return Text(
        context.l10n.questsPremiumOwnedHint,
        style: context.textStyles.body.copyWith(
          color: context.colors.textPrimary.withValues(alpha: 0.75),
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        VGCtaButton(
          label: context.l10n.questsUpgradeCta,
          icon: Assets.icons.premium.image(width: context.s(AppIconSize.x36), height: context.s(AppIconSize.x36)),
          onTap: () => buyPremium(context),
        ),
        SizedBox(width: context.s(32)),
        Text.rich(
          TextSpan(
            style: context.textStyles.body.copyWith(color: context.colors.textPrimary),
            children: [
              TextSpan(text: context.l10n.questsUpgradeHintPrefix),
              TextSpan(
                text: context.l10n.questsUpgradeHintAccent,
                style: context.textStyles.body.copyWith(color: context.colors.promoTitle),
              ),
              TextSpan(text: context.l10n.questsUpgradeHintSuffix),
            ],
          ),
        ),
      ],
    );
  }
}
