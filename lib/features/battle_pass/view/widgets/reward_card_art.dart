import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/extensions/asset_key_extension.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';

/// Item artwork inside a reward card.
class RewardCardArt extends StatelessWidget {
  const RewardCardArt({required this.reward, required this.dimmed, required this.big, super.key});

  static const List<double> _greyscale = [
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0.2126, 0.7152, 0.0722, 0, 0, //
    0, 0, 0, 1, 0, //
  ];

  final Reward reward;

  /// A taken reward keeps its silhouette but loses colour, which is how the
  /// mockup separates it from what is still up for grabs.
  final bool dimmed;

  final bool big;

  @override
  Widget build(BuildContext context) {
    final image = Padding(
      padding: EdgeInsets.all(context.s(big ? 18 : 24)),
      child: reward.icon.itemAsset.image(fit: BoxFit.contain),
    );

    if (!dimmed) return image;

    return Opacity(
      opacity: 0.45,
      child: ColorFiltered(
        colorFilter: const ColorFilter.matrix(_greyscale),
        child: image,
      ),
    );
  }
}
