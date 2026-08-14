import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The "i" next to the reward name.
///
/// The mockup does not draw what it opens, so it surfaces the hint the payload
/// already carries in a small tooltip.
class RewardHintButton extends StatelessWidget {
  const RewardHintButton({required this.hint, super.key});

  final String hint;

  @override
  Widget build(BuildContext context) => Tooltip(
    message: hint,
    triggerMode: TooltipTriggerMode.tap,
    showDuration: const Duration(seconds: 4),
    textStyle: context.textStyles.caption.copyWith(color: context.colors.textPrimary),
    decoration: BoxDecoration(
      color: context.colors.panel,
      borderRadius: BorderRadius.circular(context.s(16)),
    ),
    padding: EdgeInsets.symmetric(horizontal: context.s(AppInsets.x20), vertical: context.s(14)),
    child: Assets.icons.info.image(width: context.s(AppIconSize.x36), height: context.s(AppIconSize.x36)),
  );
}
