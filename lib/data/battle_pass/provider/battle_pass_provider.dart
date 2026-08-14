import 'package:injectable/injectable.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_response/battle_pass_response.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass_scenario.dart';
import 'package:vibe_games_demo/data/battle_pass/models/level/level.dart';
import 'package:vibe_games_demo/data/battle_pass/models/promo/promo.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/data/battle_pass/models/reward/reward.dart';
import 'package:vibe_games_demo/data/battle_pass/repository/battle_pass_repository.dart';

/// Serves canned payloads instead of a backend.
///
/// Swapping this for a real API means replacing the bodies below with calls to
/// a retrofit client — nothing above the repository interface changes.
@LazySingleton(as: BattlePassRepository)
class BattlePassProvider implements BattlePassRepository {
  BattlePassProvider();

  // TODO(vibe-games): replace mocks with BattlePassApi once the backend exists.

  /// How long the fake backend takes to answer. A load is slower than a
  /// mutation so the loading state stays a real code path rather than a branch
  /// nothing ever reaches.
  static const Duration _loadDelay = Duration(milliseconds: 350);
  static const Duration _actionDelay = Duration(milliseconds: 220);

  /// Fixed base so mocked timers are reproducible between runs.
  static final DateTime _now = DateTime(2026, 8, 14, 12);

  @override
  Future<BattlePassResponse> getBattlePass(BattlePassScenario scenario) async {
    await Future<void>.delayed(_loadDelay);
    return BattlePassResponse(
      data: switch (scenario) {
        BattlePassScenario.premiumNotOwned => _premiumNotOwned,
        BattlePassScenario.rewardAvailable => _rewardAvailable,
        BattlePassScenario.maxLevel => _maxLevel,
        BattlePassScenario.seasonFinished => _seasonFinished,
      },
    );
  }

  @override
  Future<BattlePassResponse> claim(BattlePass pass, int levelNumber) async {
    await Future<void>.delayed(_actionDelay);
    return BattlePassResponse(
      data: pass.copyWith(
        levels: [
          for (final level in pass.levels)
            if (level.number == levelNumber) level.copyWith(state: LevelState.claimed) else level,
        ],
      ),
    );
  }

  @override
  Future<BattlePassResponse> claimAll(BattlePass pass) async {
    await Future<void>.delayed(_actionDelay);
    return BattlePassResponse(
      data: pass.copyWith(
        levels: [
          for (final level in pass.levels)
            if (level.isClaimable) level.copyWith(state: LevelState.claimed) else level,
        ],
      ),
    );
  }

  @override
  Future<BattlePassResponse> claimQuest(BattlePass pass, int questId) async {
    await Future<void>.delayed(_actionDelay);
    return BattlePassResponse(
      data: pass.copyWith(
        quests: [
          for (final quest in pass.quests)
            if (quest.id == questId) quest.copyWith(claimed: true) else quest,
        ],
      ),
    );
  }

  @override
  Future<BattlePassResponse> claimPending(BattlePass pass) async {
    await Future<void>.delayed(_actionDelay);
    return BattlePassResponse(data: pass.copyWith(pendingRewards: const []));
  }

  @override
  Future<BattlePassResponse> buyPremium(BattlePass pass) async {
    await Future<void>.delayed(_actionDelay);
    return BattlePassResponse(
      // Buying the pass leaves the tray alone: the mockup keeps drawing it in
      // the premium-owned frames, so it is a pile to collect, not an upsell.
      data: pass.copyWith(premiumOwned: true, promo: _levelUpPromo),
    );
  }

  @override
  Future<BattlePassResponse> buyLevel(BattlePass pass) async {
    await Future<void>.delayed(_actionDelay);
    if (pass.isMaxLevel) return BattlePassResponse(data: pass);

    final next = pass.level + 1;
    return BattlePassResponse(
      data: pass.copyWith(
        level: next,
        xp: 0,
        levels: [
          for (final level in pass.levels)
            if (level.number == next && level.isLocked) level.copyWith(state: LevelState.available) else level,
        ],
      ),
    );
  }

  // ─── Fixtures ───────────────────────────────────────────────────────────

  static int _inDays(int days, int hours, int minutes) =>
      _now.add(Duration(days: days, hours: hours, minutes: minutes)).millisecondsSinceEpoch ~/ 1000;

  static const Promo _premiumPromo = Promo(
    title: 'Элитный пропуск',
    subtitle: 'Прокачай боевой пропуск и забери четкие скины, аксессуары и многое другое!',
    cta: 'Прокачать',
    art: 'premium',
  );

  static const Promo _levelUpPromo = Promo(
    title: 'Повышение уровня',
    subtitle: 'Повышай уровень боевого пропуска и забирай новые награды!',
    cta: 'Повысить уровень',
    art: 'levelup',
  );

  static const Promo _maxLevelPromo = Promo(
    title: 'Повышение уровня',
    subtitle: 'Повышай уровень боевого пропуска и забирай новые награды!',
    cta: 'Повысить уровень',
    art: 'levelup',
    ctaEnabled: false,
    ctaDisabledText: 'Достигнут максимальный уровень',
    claimAll: true,
  );

  /// The tray at the head of the track, read off the Figma frame.
  ///
  /// All three carry a crown. Two of them — `acc_11193` and `inv_icon_fuel`,
  /// the pendant and the fuel canister — never made it into the asset export,
  /// so other season art stands in for them; the first one is the bracelet the
  /// frame actually shows.
  static const List<Reward> _tray = [
    Reward(id: 101, name: 'Золотой браслет', icon: 'bracelet', amount: 16, tier: RewardTier.rare, premium: true),
    Reward(id: 102, name: 'Бронежилет', icon: 'vest', amount: 16, tier: RewardTier.rare, premium: true),
    Reward(id: 103, name: 'Топливо', icon: 'couple', amount: 16, tier: RewardTier.epic, premium: true),
  ];

  /// The levels, slot by slot as the frame lays them out, badges included:
  /// levels 1, 2, 4 and 5 are free, the rest sit on the premium track.
  static const List<Reward> _track = [
    Reward(id: 1, name: 'Леденец', icon: 'candy', amount: 16),
    Reward(id: 2, name: 'Пропуск', icon: 'pass', amount: 16, tier: RewardTier.rare),
    Reward(
      id: 3,
      name: 'Маска лучадора',
      icon: 'lucha_mask',
      amount: 16,
      tier: RewardTier.epic,
      premium: true,
      hint: 'Косметический предмет. Надевается в гараже.',
    ),
    Reward(id: 4, name: 'Фарфоровая маска', icon: 'doll_mask', amount: 16),
    Reward(id: 5, name: 'Золотой браслет', icon: 'bracelet', amount: 16, tier: RewardTier.rare),
    Reward(id: 6, name: 'Синий демон', icon: 'demon_mask', amount: 16, tier: RewardTier.rare, premium: true),
    Reward(id: 7, name: 'Зелёный ворчун', icon: 'grinch', amount: 16, tier: RewardTier.epic, premium: true),
    Reward(id: 8, name: 'Маска быка', icon: 'bull', amount: 16, tier: RewardTier.epic, premium: true),
    Reward(id: 9, name: 'Маска лучадора', icon: 'lucha_mask', amount: 16, tier: RewardTier.epic, premium: true),
    Reward(
      id: 10,
      name: 'Мега пак',
      icon: 'car',
      tier: RewardTier.legendary,
      premium: true,
      hint: 'Уникальный транспорт сезона и набор аксессуаров.',
    ),
  ];

  static const List<Quest> _quests = [
    Quest(
      id: 1,
      text: 'Используйте определенный предмет (Энергетик) 10 раз в классическом режиме.',
      xpReward: 25,
      progress: 1,
      goal: 3,
    ),
    Quest(id: 2, text: 'Выиграйте 3 заезда подряд на любой трассе.', xpReward: 25, progress: 1, goal: 3),
    Quest(
      id: 3,
      text: 'Проедьте 10 кругов в режиме гонки на выбывание.',
      xpReward: 1000,
      progress: 10,
      goal: 10,
      claimed: true,
    ),
    Quest(id: 4, text: 'Соберите 50 монет за один заезд.', xpReward: 25, progress: 1, goal: 3),
    Quest(id: 5, text: 'Завершите заезд, не столкнувшись с соперниками.', xpReward: 25, progress: 1, goal: 3),
  ];

  /// Levels in [claimed] are taken, levels in [available] carry a claim button,
  /// everything else is locked.
  static List<Level> _levels({Set<int> claimed = const {}, Set<int> available = const {}}) => [
    for (var i = 0; i < _track.length; i++)
      Level(
        number: i + 1,
        big: i == _track.length - 1,
        rewards: [_track[i]],
        state: switch (i + 1) {
          final n when available.contains(n) => LevelState.available,
          final n when claimed.contains(n) => LevelState.claimed,
          _ => LevelState.locked,
        },
      ),
  ];

  static BattlePass get _base => BattlePass(
    seasonId: 5,
    seasonTitle: 'Дай пять!',
    endsAt: _inDays(15, 12, 42),
    level: 2,
    maxLevel: _track.length,
    xp: 500,
    xpPerLevel: 1600,
    quests: _quests,
    pendingRewards: _tray,
    promo: _premiumPromo,
    // Only the first level carries the double check in the frame.
    levels: _levels(claimed: {1}),
  );

  static BattlePass get _premiumNotOwned => _base.copyWith(selectedLevel: 10);

  static BattlePass get _rewardAvailable => _base.copyWith(
    premiumOwned: true,
    level: 3,
    xp: 900,
    selectedLevel: 4,
    promo: _levelUpPromo,
    levels: _levels(claimed: {1, 2, 3}, available: {4}),
  );

  /// At max level the frame shows the preview card on a finished quest worth
  /// 250, with its button turned into "Забрать опыт".
  static const List<Quest> _maxLevelQuests = [
    Quest(
      id: 1,
      text: 'Используйте определенный предмет (Энергетик) 10 раз в классическом режиме.',
      xpReward: 250,
      progress: 5,
      goal: 5,
    ),
    ..._quests,
  ];

  static BattlePass get _maxLevel => _base.copyWith(
    quests: _maxLevelQuests,
    premiumOwned: true,
    level: _track.length,
    xp: 1600,
    selectedLevel: 10,
    promo: _maxLevelPromo,
    levels: _levels(claimed: {1, 2, 3}, available: {4, 5, 10}),
  );

  static BattlePass get _seasonFinished => _base.copyWith(
    premiumOwned: true,
    level: 4,
    xp: 1200,
    selectedLevel: 10,
    claimDeadline: _inDays(6, 13, 55),
    promo: _levelUpPromo,
    levels: _levels(claimed: {1, 2, 3}, available: {4}),
  );
}
