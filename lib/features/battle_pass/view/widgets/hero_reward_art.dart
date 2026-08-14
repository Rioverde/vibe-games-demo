import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/extensions/asset_key_extension.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/hero_reward.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// The selected reward, blown up in the middle of the screen.
class HeroRewardArt extends StatelessWidget {
  const HeroRewardArt({required this.reward, super.key});

  final Reward reward;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: context.s(HeroReward.artSize),
    height: context.s(HeroReward.artSize),
    // Keyed by reward so switching levels cross-fades the artwork.
    child: AnimatedSwitcher(
      duration: AppDurations.short,
      child: reward.icon.itemAsset.image(key: ValueKey(reward.id), fit: BoxFit.contain),
    ),
  );
}
