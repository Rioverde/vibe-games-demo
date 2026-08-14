import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_pressable.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Replaces the "Задания" button once the quest on the preview card is done.
///
/// Colours are the Figma ones, pale label included: the frame puts a light
/// green on a green plate, which reads dimmer than a normal button. It is kept
/// as drawn — the press feedback is what tells the player it is live.
class QuestClaimButton extends StatelessWidget {
  const QuestClaimButton({required this.onTap, super.key});

  final VoidCallback onTap;

  static const double height = 74;

  @override
  Widget build(BuildContext context) => VGPressable(
    onTap: onTap,
    child: Container(
      height: context.s(height),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: context.colors.questClaimGradient,
        ),
        borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Assets.icons.tasks.image(
            width: context.s(AppIconSize.x30),
            height: context.s(AppIconSize.x30),
          ),
          SizedBox(width: context.s(AppInsets.x16)),
          Text(
            context.l10n.questsClaimXp,
            style: context.textStyles.body.copyWith(color: context.colors.questClaimLabel),
          ),
        ],
      ),
    ),
  );
}
