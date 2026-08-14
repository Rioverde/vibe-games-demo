import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/hero_backlight.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/hero_premium_pill.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/hero_reward_art.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/hero_reward_name.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// The selected reward in the middle of the screen.
///
/// The artwork drifts and its backlight breathes on a loop. Without it the
/// centre of the screen — which is most of the screen — would be a still image,
/// and the whole layout would read as a screenshot.
class HeroReward extends StatefulWidget {
  const HeroReward({required this.reward, required this.locked, super.key});

  /// Artwork size, and the artwork plus its caption block.
  ///
  /// The caption overlaps the lower part of the art, which is what keeps the
  /// hero clear of the reward track.
  static const double artSize = 521;
  static const double totalHeight = 586;

  final Reward reward;

  /// Premium reward on a free account: the "Доступно с прокачкой!" pill shows.
  final bool locked;

  @override
  State<HeroReward> createState() => _HeroRewardState();
}

class _HeroRewardState extends State<HeroReward> with SingleTickerProviderStateMixin {
  late final AnimationController _controller = AnimationController(
    vsync: this,
    duration: AppDurations.heroBreath,
  )..repeat();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => SizedBox(
    width: context.s(HeroReward.artSize),
    height: context.s(HeroReward.totalHeight),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        AnimatedBuilder(
          animation: _controller,
          builder: (context, child) {
            final phase = math.sin(_controller.value * 2 * math.pi);
            return Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                HeroBacklight(intensity: 0.85 + phase * 0.15),
                Transform.translate(offset: Offset(0, phase * context.s(10)), child: child),
              ],
            );
          },
          child: HeroRewardArt(reward: widget.reward),
        ),
        Positioned(
          bottom: 0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              if (widget.locked) ...[
                const HeroPremiumPill(),
                SizedBox(height: context.s(10)),
              ],
              HeroRewardName(reward: widget.reward),
            ],
          ),
        ),
      ],
    ),
  );
}
