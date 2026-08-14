import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Corner badge on a reward card: crown for premium, gift for free, check for
/// already taken.
class RewardSticker extends StatelessWidget {
  const RewardSticker({required this.icon, this.gradient, this.transparent = false, super.key});

  final AssetGenImage icon;

  /// Gradient plate behind the icon; null falls back to the flat pill colour.
  final List<Color>? gradient;

  /// Draws the icon with no plate at all — used by the "received" check.
  final bool transparent;

  @override
  Widget build(BuildContext context) => Container(
    width: context.s(55),
    height: context.s(50),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(context.s(AppRadius.x18)),
      color: transparent || gradient != null ? null : context.colors.pill,
      gradient: gradient == null ? null : LinearGradient(colors: gradient!),
    ),
    child: icon.image(width: context.s(AppIconSize.x36), height: context.s(AppIconSize.x36)),
  );
}
