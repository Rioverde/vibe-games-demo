import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// "Доступно с прокачкой!" — shown when the hero reward sits on the premium
/// track and the player has not bought it.
class HeroPremiumPill extends StatelessWidget {
  const HeroPremiumPill({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: context.s(39),
    padding: EdgeInsets.symmetric(horizontal: context.s(AppInsets.x20)),
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: context.colors.premiumGradient),
      borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Assets.icons.premium.image(width: context.s(AppIconSize.x30), height: context.s(AppIconSize.x30)),
        SizedBox(width: context.s(10)),
        Text(
          context.l10n.battlePassPremiumAvailable,
          style: context.textStyles.caption.copyWith(color: context.colors.textOnAccent),
        ),
      ],
    ),
  );
}
