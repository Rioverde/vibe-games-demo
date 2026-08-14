import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_hint_button.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Name of the hero reward, with the hint button when the payload has one.
class HeroRewardName extends StatelessWidget {
  const HeroRewardName({required this.reward, super.key});

  final Reward reward;

  @override
  Widget build(BuildContext context) => Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Text(
        reward.name,
        style: context.textStyles.h3.copyWith(color: context.colors.textPrimary),
      ),
      if (reward.hasHint) ...[
        SizedBox(width: context.s(AppInsets.x16)),
        RewardHintButton(hint: reward.hint),
      ],
    ],
  );
}
