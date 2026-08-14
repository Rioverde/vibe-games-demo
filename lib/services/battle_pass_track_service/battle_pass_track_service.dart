import 'package:injectable/injectable.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// Geometry and progress maths for the reward track.
///
/// Kept out of the widgets: the track is the one place on the screen where
/// layout is computed rather than declared, and that arithmetic is worth
/// testing without pumping a widget tree.
@LazySingleton()
class BattlePassTrackService {
  const BattlePassTrackService();

  /// Levels that scroll. The final one is pinned separately, so it is excluded.
  ///
  /// Nothing is filtered out for the tray: it holds rewards that never were
  /// steps on the track, which is why the pins keep counting 1, 2, 3 … without
  /// a gap no matter how much is waiting there.
  List<Level> scrollingLevels(BattlePass pass) => [
    for (final level in pass.levels)
      if (!level.big) level,
  ];

  /// The season's headline reward, parked at the right edge of the track.
  Level? finalLevel(BattlePass pass) => pass.levels.where((level) => level.big).lastOrNull;

  /// Width of the scrollable row, in design units.
  double rowWidth(BattlePass pass) => AppLayout.trackSlot * scrollingLevels(pass).length;

  /// 0..1 share of the track the player has reached.
  ///
  /// Measured between pin centres, which is why the denominator is one slot
  /// short of the row: the rail starts at the first pin, not at the row edge.
  double progress(BattlePass pass) {
    final levels = scrollingLevels(pass);
    if (levels.length < 2) return 0;
    return ((pass.level - 1) / (levels.length - 1)).clamp(0.0, 1.0);
  }

  /// Where the pass stands along the rail, measured in pin numbers.
  ///
  /// The experience towards the next level is the fraction, so the rail creeps
  /// forward with every quest instead of snapping a whole segment the moment a
  /// level lands.
  double railProgress(BattlePass pass) => pass.level + levelFill(pass);

  /// 0..1 fill of the rail between the pins [from] and [to] at [progress].
  ///
  /// Reads one shared front rather than animating per segment: every piece of
  /// rail derives its share from the same number, so the fill travels as a
  /// single line instead of several bars growing at once. A segment spanning
  /// more than one level — the numbering skips the big ones — is filled by the
  /// share of that span, not by the first level in it.
  double railFill({required double progress, required int from, required int to}) {
    final span = to - from;
    if (span <= 0) return progress >= to ? 1 : 0;
    return ((progress - from) / span).clamp(0.0, 1.0);
  }

  /// 0..1 fill of the level ring. A maxed pass reads as a full ring.
  double levelFill(BattlePass pass) {
    if (pass.isMaxLevel) return 1;
    if (pass.xpPerLevel <= 0) return 0;
    return (pass.xp / pass.xpPerLevel).clamp(0.0, 1.0);
  }

  /// Extra horizontal room the leaning card plate needs beyond its width.
  double cardOverhang(double height) => height * -RewardCard.lean;

  /// Scroll offset after nudging [slots] cards, clamped to the given extents.
  double nudgeOffset({
    required double current,
    required double slotWidth,
    required double minExtent,
    required double maxExtent,
    int slots = AppLayout.trackNudgeSlots,
  }) => (current + slots * slotWidth).clamp(minExtent, maxExtent);
}
