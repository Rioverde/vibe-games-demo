import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';

/// Round translucent button — screen close, track arrows.
///
/// The mockup uses two sizes with different fill opacities: 100 at 5% for the
/// screen chrome and 84 at 10% for controls sitting on top of artwork.
class VGCircleIconButton extends StatelessWidget {
  const VGCircleIconButton({
    required this.icon,
    this.onTap,
    this.size = 100,
    this.iconSize = 36,
    this.fillOpacity = 0.05,
    this.flipHorizontally = false,
    super.key,
  });

  const VGCircleIconButton.small({
    required AssetGenImage icon,
    VoidCallback? onTap,
    bool flipHorizontally = false,
    Key? key,
  }) : this(
         icon: icon,
         onTap: onTap,
         size: 84,
         fillOpacity: 0.1,
         flipHorizontally: flipHorizontally,
         key: key,
       );

  final AssetGenImage icon;
  final VoidCallback? onTap;

  /// Button and icon sizes in design units.
  final double size;
  final double iconSize;

  final double fillOpacity;

  /// The mockup only ships a right arrow; the left one is the same art mirrored.
  final bool flipHorizontally;

  @override
  Widget build(BuildContext context) {
    final image = icon.image(width: context.s(iconSize), height: context.s(iconSize));

    return VGPressable(
      onTap: onTap,
      disabledOpacity: 0.35,
      child: Container(
        width: context.s(size),
        height: context.s(size),
        alignment: Alignment.center,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: context.colors.textPrimary.withValues(alpha: fillOpacity),
        ),
        child: flipHorizontally ? Transform.flip(flipX: true, child: image) : image,
      ),
    );
  }
}
