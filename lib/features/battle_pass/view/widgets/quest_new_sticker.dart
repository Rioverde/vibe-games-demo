import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The small gold badge on the corner of the quest preview card.
///
/// Every variant of the component in Figma carries it, so it is not tied to a
/// particular quest state — it marks the card itself as worth a look.
class QuestNewSticker extends StatelessWidget {
  const QuestNewSticker({super.key});

  static const double width = 32;
  static const double height = 34;

  @override
  Widget build(BuildContext context) => Container(
    width: context.s(width),
    height: context.s(height),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: context.colors.newStickerGradient,
      ),
      borderRadius: BorderRadius.circular(context.s(AppRadius.x12)),
      boxShadow: [
        BoxShadow(
          color: context.colors.newStickerGradient.first.withValues(alpha: 0.6),
          blurRadius: context.s(AppInsets.x10),
        ),
      ],
    ),
    child: Text(
      '!',
      style: context.textStyles.caption.copyWith(color: context.colors.chip),
    ),
  );
}
