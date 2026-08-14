import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The primary gold button ("Прокачать", "Повысить уровень").
///
/// Disabled it drops the gradient and the glow and reads as a flat plate, which
/// is how the max-level frame draws it.
class VGCtaButton extends StatelessWidget {
  const VGCtaButton({
    required this.label,
    this.onTap,
    this.icon,
    this.width = 400,
    this.height = 100,
    this.color,
    super.key,
  });

  final String label;
  final VoidCallback? onTap;

  /// Leading icon, already sized by the caller.
  final Widget? icon;

  /// Button size in design units.
  final double width;
  final double height;

  /// Flat fill instead of the gold gradient — used by the green claim actions.
  final Color? color;

  bool get _enabled => onTap != null;

  bool get _isGold => color == null;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: onTap,
    child: SizedBox(
      width: context.s(width),
      height: context.s(height),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
          color: _enabled ? color : context.colors.textPrimary.withValues(alpha: 0.1),
          gradient: _enabled && _isGold ? LinearGradient(colors: context.colors.ctaGradient) : null,
          boxShadow: _enabled && _isGold
              ? [
                  BoxShadow(
                    color: context.colors.ctaGlow.withValues(alpha: 0.7),
                    blurRadius: context.s(41.5),
                  ),
                ]
              : null,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (icon != null) ...[
              icon!,
              SizedBox(width: context.s(AppInsets.x24)),
            ],
            Flexible(
              child: Text(
                label,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: context.textStyles.button.copyWith(
                  color: _enabled ? context.colors.textOnAccent : context.colors.textPrimary.withValues(alpha: 0.4),
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
