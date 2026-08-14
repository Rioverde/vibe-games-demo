import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_pin.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_level_card.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_slot.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_slot_column.dart';

/// The season's headline reward, parked at the end of the track so it stays in
/// sight no matter how far the row is scrolled.
///
/// It is laid out with the same [TrackSlot] as the scrolling levels, so its card
/// and pin line up with theirs without anyone positioning it by hand.
class TrackFinalLevel extends StatelessWidget {
  const TrackFinalLevel({required this.level, required this.pass, super.key});

  final Level level;
  final BattlePass pass;

  @override
  Widget build(BuildContext context) => TrackSlotColumn(
    card: TrackLevelCard(level: level, pass: pass, big: true),
    footer: LevelPin(number: level.number, reached: level.number <= pass.level),
  );
}
