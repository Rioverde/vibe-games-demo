import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Hairline between the reward header and the progress of a quest card.
class QuestCardDivider extends StatelessWidget {
  const QuestCardDivider({super.key});

  @override
  Widget build(BuildContext context) => Container(
    height: context.s(AppInsets.x2),
    color: context.colors.textPrimary.withValues(alpha: 0.08),
  );
}
