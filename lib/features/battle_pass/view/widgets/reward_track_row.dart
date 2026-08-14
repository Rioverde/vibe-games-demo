import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/common/utils/battle_pass_actions_mixin.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/claim_all_bar.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_pin.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_card.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_arrow.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_card_entrance.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_level_card.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_rail_segment.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_slot.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// The scrolling part of the track.
///
/// Built as a lazy list of equal slots rather than a stack of hand-placed
/// children: the schema allows a hundred levels, and a row that positions every
/// card by `index * slotWidth` both builds all of them up front and has to
/// recompute its geometry whenever anything about the track changes.
///
/// The row opens with the tray of rewards waiting to be collected, under a
/// single "collect all" bar. Those carry no pins and do not shift the
/// numbering: the mockup counts the level pins 1, 2, 3 … without a break no
/// matter how much is waiting there, and it draws the same tray whether or not
/// the premium is owned.
class RewardTrackRow extends StatelessWidget with BattlePassActionsMixin {
  const RewardTrackRow({
    required this.pass,
    required this.controller,
    required this.entrance,
    required this.rail,
    super.key,
  });

  final BattlePass pass;
  final ScrollController controller;

  /// Drives the staggered entrance of the cards, 0..1.
  final Animation<double> entrance;

  /// Where the rail's fill currently stands, in pin numbers. Shared by every
  /// segment, so the row fills as one line rather than as several bars.
  final Animation<double> rail;

  @override
  Widget build(BuildContext context) {
    final service = getIt<BattlePassTrackService>();
    final tray = pass.tray;
    final levels = service.scrollingLevels(pass);

    return ListView.builder(
      controller: controller,
      scrollDirection: Axis.horizontal,
      // Explicitly zero: a horizontal ListView with a null padding quietly
      // adopts MediaQuery's horizontal padding, so the display cutout would
      // push the whole row in from the edge the panels above it line up with.
      padding: EdgeInsets.zero,
      itemCount: tray.length + levels.length,
      itemBuilder: (context, index) => TrackCardEntrance(
        animation: entrance,
        index: index,
        child: index < tray.length
            ? _traySlot(context, index: index, tray: tray)
            : _levelSlot(index: index - tray.length, levels: levels, service: service),
      ),
    );
  }

  Widget _traySlot(BuildContext context, {required int index, required List<Reward> tray}) => TrackSlot(
    width: index < 3 ? 220 : AppLayout.traySlot,
    card: RewardCard(
      reward: tray[index],
      state: LevelState.locked,
      selected: false,
      premiumOwned: pass.premiumOwned,
    ),
    // The bar spans the whole tray, so only its first slot draws it and is let
    // out of its own width to reach across the ones after it.
    footer: index > 0
        ? const SizedBox.shrink()
        : OverflowBox(
            alignment: Alignment.centerLeft,
            maxWidth: context.s(AppLayout.trayBarWidth + AppLayout.trayBarInset),
            child: SizedBox(
              width: context.s(AppLayout.trayBarWidth),
              child: ClaimAllBar(onTap: () => claimPending(context)),
            ),
          ),
  );

  Widget _levelSlot({
    required int index,
    required List<Level> levels,
    required BattlePassTrackService service,
  }) {
    final level = levels[index];
    final hasPrevious = index > 0;
    final hasNext = index < levels.length - 1;

    return TrackSlot(
      card: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.none,
        children: [
          TrackLevelCard(level: level, pass: pass),
          // Sits a couple of units ahead of the card, as in the frame.
          const Positioned(left: -TrackArrow.lead, child: TrackArrow()),
        ],
      ),
      footer: Stack(
        alignment: Alignment.center,
        children: [
          AnimatedBuilder(
            animation: rail,
            builder: (context, _) {
              // A segment between two pins is drawn by both of them, half each,
              // so a slot shows only the part of that segment on its own side:
              // the half after the pin fills over the first half of the travel,
              // the half before the next pin over the second.
              final before = hasPrevious
                  ? service.railFill(progress: rail.value, from: levels[index - 1].number, to: level.number)
                  : 0.0;
              final after = hasNext
                  ? service.railFill(progress: rail.value, from: level.number, to: levels[index + 1].number)
                  : 0.0;

              return TrackRailSegment(
                hasPrevious: hasPrevious,
                hasNext: hasNext,
                fillBefore: (before * 2 - 1).clamp(0.0, 1.0),
                fillAfter: (after * 2).clamp(0.0, 1.0),
              );
            },
          ),
          LevelPin(number: level.number, reached: level.number <= pass.level),
        ],
      ),
    );
  }
}
