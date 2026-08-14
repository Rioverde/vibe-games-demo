import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';

/// The bar under the tray of rewards waiting to be collected.
///
/// It stands where the level pins would be: those rewards are not a step on the
/// track, they are a pile with one action on it.
///
/// Values are the Figma ones: a warm wash at a third of its strength, no
/// outline at all, and a label that carries its own ember glow.
class ClaimAllBar extends StatelessWidget {
  const ClaimAllBar({required this.onTap, super.key});

  final VoidCallback onTap;

  static const double height = 60;
  static const double radius = 20;

  /// Opacity of the plate behind the label.
  static const double plateOpacity = 0.3;

  /// Blur of the glow the label sits in.
  static const double glowBlur = 14.4;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: onTap,
    child: Container(
      height: context.s(height),
      alignment: Alignment.center,

      decoration: BoxDecoration(
        color: context.colors.trayBar.withValues(alpha: plateOpacity),
        borderRadius: BorderRadius.circular(context.s(radius)),
      ),
      child: Text(
        context.l10n.battlePassClaimAllPending,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: context.textStyles.button.copyWith(
          color: context.colors.promoTitle,
          shadows: [
            Shadow(
              color: context.colors.trayBarGlow,
              blurRadius: context.s(glowBlur),
            ),
          ],
        ),
      ),
    ),
  );
}
