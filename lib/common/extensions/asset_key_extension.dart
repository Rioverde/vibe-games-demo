import 'package:vibe_games_demo/generated/assets.gen.dart';

/// Resolves the asset keys the payload carries into generated assets.
///
/// The backend names a reward's art by key, so the mapping lives here instead
/// of a switch inside the card widget.
extension RewardIconExtension on String {
  AssetGenImage get itemAsset => switch (this) {
    'vest' => Assets.images.heroVest,
    'car' => Assets.images.heroCar,
    'couple' => Assets.images.heroCouple,
    'bracelet' => Assets.images.items.bracelet,
    'candy' => Assets.images.items.candy,
    'bull' => Assets.images.items.bull,
    'doll_mask' => Assets.images.items.dollMask,
    'pass' => Assets.images.items.pass,
    'lucha_mask' => Assets.images.items.luchaMask,
    'demon_mask' => Assets.images.items.demonMask,
    'grinch' => Assets.images.items.grinch,
    // An unmapped key renders a placeholder instead of throwing mid-list.
    _ => Assets.images.items.pass,
  };

  AssetGenImage get bannerAsset => switch (this) {
    'levelup' => Assets.images.bannerLevelup,
    _ => Assets.images.bannerPremium,
  };
}
