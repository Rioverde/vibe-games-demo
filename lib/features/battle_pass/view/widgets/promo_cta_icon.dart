import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_up_icon_painter.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Leading icon of the promo button.
///
/// The panel sells two different things and the mockup marks them apart: a
/// crown while the pass itself is for sale, the level-up arrow once it is
/// levels being bought.
class PromoCtaIcon extends StatelessWidget {
  const PromoCtaIcon({required this.art, super.key});

  /// Asset key of the banner the promo is showing.
  final String art;

  static const String levelUpArt = 'levelup';

  @override
  Widget build(BuildContext context) {
    final side = context.s(AppIconSize.x36);

    if (art != levelUpArt) {
      return Assets.icons.premium.image(width: side, height: side);
    }

    return CustomPaint(
      size: Size(side, side),
      painter: LevelUpIconPainter(color: context.colors.textOnAccent),
    );
  }
}
