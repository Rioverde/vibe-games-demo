import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// Page indicators under the quest preview card.
class QuestPreviewDots extends StatelessWidget {
  const QuestPreviewDots({required this.count, required this.active, super.key});

  final int count;
  final int active;

  @override
  Widget build(BuildContext context) => Row(
    children: [
      for (var i = 0; i < count; i++) ...[
        if (i > 0) SizedBox(width: context.s(AppInsets.x12)),
        Expanded(
          child: AnimatedContainer(
            duration: AppDurations.short,
            height: context.s(AppInsets.x8),
            decoration: BoxDecoration(
              color: context.colors.textPrimary.withValues(alpha: i == active ? 0.6 : 0.1),
              borderRadius: BorderRadius.circular(context.s(4)),
            ),
          ),
        ),
      ],
    ],
  );
}
