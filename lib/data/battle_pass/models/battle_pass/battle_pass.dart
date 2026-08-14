import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/models/promo/promo.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';

part 'battle_pass.freezed.dart';
part 'battle_pass.g.dart';

/// Everything the battle pass screen draws.
///
/// The visual state is derived from these fields rather than sent as a mode,
/// so the screen cannot end up in a combination the backend would never produce.
@freezed
sealed class BattlePass with _$BattlePass {
  const factory BattlePass({
    /// id of the season
    @Default(0) int seasonId,

    /// season heading in the info bar, e.g. "Дай пять!"
    @Default('') String seasonTitle,

    /// unix time the season ends at; drives the info bar timer
    @Default(0) int endsAt,

    /// current level — the number inside the ring
    @Default(0) int level,

    /// last level of the season
    @Default(0) int maxLevel,

    /// experience gained inside the current level
    @Default(0) int xp,

    /// experience needed for the next level; xp/xpPerLevel fills the ring
    @Default(0) int xpPerLevel,

    /// whether the premium track is owned — the main state switch
    @Default(false) bool premiumOwned,

    /// season is over but rewards are still claimable until this unix time
    @Default(0) int claimDeadline,

    /// which level is opened in the middle of the screen
    @Default(1) int selectedLevel,

    /// right-hand promo panel
    @Default(Promo()) Promo promo,

    /// the reward track
    @Default(<Level>[]) List<Level> levels,

    /// quests for the second screen and the preview card
    @Default(<Quest>[]) List<Quest> quests,

    /// rewards waiting to be collected, gathered at the head of the track
    ///
    /// Kept apart from [levels] because the mockup numbers the level pins 1, 2,
    /// 3 … without a break while these carry no pin at all. They are not tied
    /// to the pass either: the same cluster and its "collect all" bar are drawn
    /// whether or not the premium is owned.
    @Default(<Reward>[]) List<Reward> pendingRewards,
  }) = _BattlePass;

  const BattlePass._();

  factory BattlePass.fromJson(Map<String, dynamic> json) => _$BattlePassFromJson(json);

  factory BattlePass.mock() => BattlePass(
    seasonId: 5,
    seasonTitle: 'Дай пять!',
    level: 2,
    maxLevel: 10,
    xp: 500,
    xpPerLevel: 1600,
    promo: Promo.mock(),
    levels: [Level.mock()],
    quests: [Quest.mock()],
  );

  bool get isMaxLevel => level >= maxLevel;

  /// The season is over but the rewards are still claimable.
  bool get isFinished => claimDeadline > 0;

  bool get hasUnclaimed => levels.any((level) => level.isClaimable);

  /// What the tray at the head of the track shows.
  ///
  /// It empties when the player collects it, not when they buy something: the
  /// mockup draws the same cluster in the premium-owned frames.
  List<Reward> get tray => pendingRewards;

  /// The level currently opened in the middle of the screen.
  Level? get selected {
    for (final level in levels) {
      if (level.number == selectedLevel) return level;
    }
    return levels.isEmpty ? null : levels.first;
  }

  /// The quest shown on the preview card. Unfinished ones come first so the
  /// card never advertises something already done.
  Quest? get featuredQuest {
    if (quests.isEmpty) return null;
    for (final quest in quests) {
      if (!quest.claimed) return quest;
    }
    return quests.first;
  }

  DateTime get endsAtDate => DateTime.fromMillisecondsSinceEpoch(endsAt * 1000);

  DateTime get claimDeadlineDate => DateTime.fromMillisecondsSinceEpoch(claimDeadline * 1000);
}
