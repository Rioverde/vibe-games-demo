import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';

/// The game's global navigation rail.
///
/// It belongs to the surrounding game shell rather than to the battle pass, so
/// it is drawn as one exported strip: reimplementing eleven unrelated menu
/// entries would add files the feature never uses. The panel behind it is real,
/// so it tints whatever the background art puts underneath.
///
/// The rail keeps its design width and swallows the display cutout the way the
/// mockup does — the notch sits inside the panel, and the icon column is
/// right-aligned so it stays clear of it.
class LeftNavBar extends StatelessWidget {
  const LeftNavBar({super.key});

  /// Rail width, and the width of the icon column inside it.
  static const double width = 295;
  static const double itemsWidth = 160;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: context.s(LeftNavBar.width),
    child: ColoredBox(
      color: context.colors.navBar.withValues(alpha: 0.7),
      child: Align(
        alignment: Alignment.centerRight,
        child: SizedBox(
          width: context.s(LeftNavBar.itemsWidth),
          child: Assets.images.nav.navItems.image(fit: BoxFit.contain),
        ),
      ),
    ),
  );
}
