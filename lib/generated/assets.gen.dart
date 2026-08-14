import 'package:flutter/widgets.dart';

// dart format width=120

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/arrow_right.png
  AssetGenImage get arrowRight => const AssetGenImage('assets/icons/arrow_right.png');

  /// File path: assets/icons/close.png
  AssetGenImage get close => const AssetGenImage('assets/icons/close.png');

  /// File path: assets/icons/gift.png
  AssetGenImage get gift => const AssetGenImage('assets/icons/gift.png');

  /// File path: assets/icons/info.png
  AssetGenImage get info => const AssetGenImage('assets/icons/info.png');

  /// File path: assets/icons/premium.png
  AssetGenImage get premium => const AssetGenImage('assets/icons/premium.png');

  /// File path: assets/icons/received.png
  AssetGenImage get received => const AssetGenImage('assets/icons/received.png');

  /// File path: assets/icons/tasks.png
  AssetGenImage get tasks => const AssetGenImage('assets/icons/tasks.png');

  /// File path: assets/icons/timer.png
  AssetGenImage get timer => const AssetGenImage('assets/icons/timer.png');

  /// File path: assets/icons/xp.png
  AssetGenImage get xp => const AssetGenImage('assets/icons/xp.png');

  /// List of all assets
  List<AssetGenImage> get values => [arrowRight, close, gift, info, premium, received, tasks, timer, xp];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/banner_levelup.png
  AssetGenImage get bannerLevelup => const AssetGenImage('assets/images/banner_levelup.png');

  /// File path: assets/images/banner_premium.png
  AssetGenImage get bannerPremium => const AssetGenImage('assets/images/banner_premium.png');

  /// File path: assets/images/bg.png
  AssetGenImage get bg => const AssetGenImage('assets/images/bg.png');

  /// File path: assets/images/hero_car.png
  AssetGenImage get heroCar => const AssetGenImage('assets/images/hero_car.png');

  /// File path: assets/images/hero_couple.png
  AssetGenImage get heroCouple => const AssetGenImage('assets/images/hero_couple.png');

  /// File path: assets/images/hero_vest.png
  AssetGenImage get heroVest => const AssetGenImage('assets/images/hero_vest.png');

  /// Directory path: assets/images/items
  $AssetsImagesItemsGen get items => const $AssetsImagesItemsGen();

  /// Directory path: assets/images/nav
  $AssetsImagesNavGen get nav => const $AssetsImagesNavGen();

  /// List of all assets
  List<AssetGenImage> get values => [bannerLevelup, bannerPremium, bg, heroCar, heroCouple, heroVest];
}

class $AssetsImagesItemsGen {
  const $AssetsImagesItemsGen();

  /// File path: assets/images/items/bracelet.png
  AssetGenImage get bracelet => const AssetGenImage('assets/images/items/bracelet.png');

  /// File path: assets/images/items/bull.png
  AssetGenImage get bull => const AssetGenImage('assets/images/items/bull.png');

  /// File path: assets/images/items/candy.png
  AssetGenImage get candy => const AssetGenImage('assets/images/items/candy.png');

  /// File path: assets/images/items/demon_mask.png
  AssetGenImage get demonMask => const AssetGenImage('assets/images/items/demon_mask.png');

  /// File path: assets/images/items/doll_mask.png
  AssetGenImage get dollMask => const AssetGenImage('assets/images/items/doll_mask.png');

  /// File path: assets/images/items/grinch.png
  AssetGenImage get grinch => const AssetGenImage('assets/images/items/grinch.png');

  /// File path: assets/images/items/lucha_mask.png
  AssetGenImage get luchaMask => const AssetGenImage('assets/images/items/lucha_mask.png');

  /// File path: assets/images/items/pass.png
  AssetGenImage get pass => const AssetGenImage('assets/images/items/pass.png');

  /// List of all assets
  List<AssetGenImage> get values => [bracelet, bull, candy, demonMask, dollMask, grinch, luchaMask, pass];
}

class $AssetsImagesNavGen {
  const $AssetsImagesNavGen();

  /// File path: assets/images/nav/nav_items.png
  AssetGenImage get navItems => const AssetGenImage('assets/images/nav/nav_items.png');

  /// List of all assets
  List<AssetGenImage> get values => [navItems];
}

abstract final class Assets {
  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName, {this.size, this.flavors = const {}, this.animation});

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({required this.isAnimation, required this.duration, required this.frames});

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
