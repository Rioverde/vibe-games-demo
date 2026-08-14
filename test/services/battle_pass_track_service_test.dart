import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';

BattlePass passWith({int level = 1, int xp = 0, int xpPerLevel = 1600, int levels = 10}) => BattlePass(
  level: level,
  maxLevel: levels,
  xp: xp,
  xpPerLevel: xpPerLevel,
  levels: [for (var i = 1; i <= levels; i++) Level(number: i, big: i == levels)],
);

void main() {
  const service = BattlePassTrackService();

  group('track split', () {
    test('the final level is kept out of the scrolling row', () {
      final pass = passWith();

      expect(service.scrollingLevels(pass).length, 9);
      expect(service.finalLevel(pass)?.number, 10);
    });

    test('a track without a big level pins nothing', () {
      final pass = passWith().copyWith(levels: const [Level(number: 1)]);

      expect(service.finalLevel(pass), isNull);
    });
  });

  group('tray', () {
    BattlePass trayPass({bool premiumOwned = false}) => passWith(level: 3).copyWith(
      premiumOwned: premiumOwned,
      pendingRewards: const [
        Reward(id: 1, name: 'a', icon: 'pass', premium: true),
        Reward(id: 2, name: 'b', icon: 'pass', premium: true),
      ],
    );

    test('shows what the payload put aside while the pass is unsold', () {
      expect(trayPass().tray.map((r) => r.id), [1, 2]);
    });

    test('survives the purchase — the mockup keeps it in the owned frames', () {
      expect(trayPass(premiumOwned: true).tray, isNotEmpty);
    });

    test('takes no level out of the row, so the pins keep counting from one', () {
      final numbers = service.scrollingLevels(trayPass()).map((l) => l.number).toList();

      expect(numbers.first, 1);
      expect(numbers, isNot(contains(10)), reason: 'the final level is pinned separately');
    });
  });

  group('progress', () {
    test('is measured between pin centres', () {
      // 9 scrolling levels → 8 gaps; level 5 sits on the fourth gap.
      expect(service.progress(passWith(level: 5)), closeTo(0.5, 0.001));
    });

    test('clamps past the last scrolling level', () {
      expect(service.progress(passWith(level: 10)), 1);
    });

    test('is zero when the track is too short to have gaps', () {
      expect(service.progress(passWith(levels: 1)), 0);
    });
  });

  group('rail', () {
    test('stands at the level plus the experience towards the next one', () {
      expect(service.railProgress(passWith(level: 3, xp: 400)), closeTo(3.25, 0.001));
    });

    test('creeps forward with the experience inside the segment', () {
      expect(service.railFill(progress: 3.25, from: 3, to: 4), closeTo(0.25, 0.001));
    });

    test('is full behind the front and empty ahead of it', () {
      expect(service.railFill(progress: 3.25, from: 2, to: 3), 1);
      expect(service.railFill(progress: 3.25, from: 4, to: 5), 0);
    });

    test('spreads over a segment that skips a level', () {
      expect(service.railFill(progress: 3.5, from: 2, to: 5), closeTo(0.5, 0.001));
    });

    test('reads a segment without a span from the front alone', () {
      expect(service.railFill(progress: 3.25, from: 3, to: 3), 1);
      expect(service.railFill(progress: 3.25, from: 4, to: 4), 0);
    });
  });

  group('level ring', () {
    test('fills proportionally inside the current level', () {
      expect(service.levelFill(passWith(level: 2, xp: 400)), 0.25);
    });

    test('reads full at the season maximum regardless of xp', () {
      expect(service.levelFill(passWith(level: 10)), 1);
    });

    test('survives a zero xpPerLevel from the backend', () {
      expect(service.levelFill(passWith(level: 2, xpPerLevel: 0)), 0);
    });
  });

  group('scrolling', () {
    test('nudging clamps to the scroll extents', () {
      expect(
        service.nudgeOffset(current: 900, slotWidth: 100, minExtent: 0, maxExtent: 1000),
        1000,
      );
      expect(
        service.nudgeOffset(current: 0, slotWidth: 100, minExtent: 0, maxExtent: 1000, slots: -5),
        0,
      );
    });
  });
}
