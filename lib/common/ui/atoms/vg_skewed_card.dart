import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';

/// The leaning rounded plate every reward sits on.
///
/// Measured off the exported Figma shape. Only the plate leans — the item art
/// and the badges stay upright, exactly as in the mockup, so the skew is applied
/// to the background alone rather than to the whole subtree.
///
/// Anything that belongs to the *surface* — a light, a texture — goes in [plate]
/// rather than in [child]. An upright layer stops on a vertical line, while the
/// plate under it carries on leaning, and the two edges part company by the
/// whole overhang: the card then shows a seam down its side where the surface
/// ends before the plate does.
class VGSkewedCard extends StatelessWidget {
  const VGSkewedCard({
    required this.width,
    required this.height,
    required this.decoration,
    this.plate,
    this.child,
    super.key,
  });

  /// Plate width in design units.
  final double width;

  /// Plate height in design units.
  final double height;

  final Decoration decoration;

  /// Painted on the plate itself, so it leans with it and is cut by its shape.
  final Widget? plate;

  /// Painted over the plate and left upright, as the mockup keeps the art and
  /// the badges.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final w = context.s(width);
    final h = context.s(height);
    final overhang = getIt<BattlePassTrackService>().cardOverhang(h);

    return SizedBox(
      width: w + overhang,
      height: h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.skewX(RewardCard.lean),
            child: Container(
              width: w,
              height: h,
              clipBehavior: Clip.antiAlias,
              decoration: decoration,
              child: plate,
            ),
          ),
          if (child != null) SizedBox(width: w, height: h, child: child),
        ],
      ),
    );
  }
}
