import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/extensions/asset_key_extension.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/promo_panel.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// Everything painted behind the interface: season art, the vignette the reward
/// track sits on, and the promo artwork in the top-right corner.
///
/// The promo art belongs here rather than in the content column because it is
/// decoration that bleeds to the screen edge, while the copy on top of it is
/// laid out with the rest of the UI.
class BattlePassBackground extends StatelessWidget {
  const BattlePassBackground({this.promoArt, super.key});

  /// Asset key of the banner art the payload asks for.
  ///
  /// Null until a payload arrives: the banner belongs to the promo the screen
  /// is showing, so it must not sit in the corner while there is nothing to
  /// promote yet.
  final String? promoArt;

  /// Height of the gradient under the track, in design units.
  static const double shadowHeight = 440;

  @override
  Widget build(BuildContext context) => Stack(
    fit: StackFit.expand,
    children: [
      ColoredBox(color: context.colors.background),
      Assets.images.bg.image(fit: BoxFit.cover),
      if (promoArt != null)
        Align(
          alignment: Alignment.topRight,
          child: SizedBox(
            // Only the width is pinned: the two banners have different heights
            // because the premium one is cut where its baked-in copy starts, so
            // each asset keeps its own aspect ratio instead of being squashed
            // into a shared box.
            width: context.s(PromoPanel.artWidth),
            child: AnimatedSwitcher(
              duration: AppDurations.medium,
              child: promoArt!.bannerAsset.image(key: ValueKey(promoArt), fit: BoxFit.fitWidth),
            ),
          ),
        ),
      Align(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          height: context.s(shadowHeight),
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  context.colors.bottomShadowGradient.first.withValues(alpha: 0),
                  ...context.colors.bottomShadowGradient,
                ],
                stops: const [0, 0.35, 0.7, 1],
              ),
            ),
          ),
        ),
      ),
    ],
  );
}
