import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The "Задания" button at the bottom of the quest preview card.
class QuestsButton extends StatelessWidget {
  const QuestsButton({required this.onTap, super.key});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: onTap,
    child: Container(
      height: context.s(74),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: context.colors.textPrimary.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.tasks.image(width: context.s(AppIconSize.x30), height: context.s(AppIconSize.x30)),
          SizedBox(width: context.s(AppInsets.x16)),
          Text(
            context.l10n.battlePassQuests,
            style: context.textStyles.body.copyWith(color: context.colors.textPrimary),
          ),
        ],
      ),
    ),
  );
}
