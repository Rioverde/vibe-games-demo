import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';

/// Maps a reward tier onto the palette.
///
/// Keeps the lookup out of the card widget, so a re-skin is a theme change and
/// the widget never indexes into a color list by hand.
extension RewardTierExtension on RewardTier {
  List<Color> gradient(BuildContext context) => context.colors.tierGradients[index];

  Color accent(BuildContext context) => context.colors.tierAccents[index];
}
