import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Outline around the card the screen is currently showing in the middle.
///
/// Wrapped in an [IgnorePointer]: a [DecoratedBox] reports a hit for every point
/// inside its shape, so an overlay drawn on top of the card would otherwise
/// swallow taps meant for the claim button underneath it.
class RewardSelectionFrame extends StatelessWidget {
  const RewardSelectionFrame({required this.color, super.key});

  final Color color;

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: Transform(
      alignment: Alignment.center,
      transform: Matrix4.skewX(RewardCard.lean),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
          border: Border.all(color: color, width: context.s(AppInsets.x4)),
          boxShadow: [
            BoxShadow(color: color.withValues(alpha: 0.35), blurRadius: context.s(24)),
          ],
        ),
      ),
    ),
  );
}
