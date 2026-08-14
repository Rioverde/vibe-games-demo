import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/season_deadline_pill.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/season_warning_badge.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Shown once the season is over: the pass is closed but the rewards already
/// earned can still be collected.
///
/// It takes the quest card's place — with the season finished there is nothing
/// left to earn, so advertising quests there would be a dead end.
class SeasonFinishedCard extends StatelessWidget {
  const SeasonFinishedCard({required this.deadline, super.key});

  /// Card width, and how far the warning badge straddles its top border.
  static const double width = 466;
  static const double badgeOverlap = 28;

  final DateTime deadline;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: context.s(SeasonFinishedCard.width),
    child: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.topCenter,
      children: [
        Container(
          margin: EdgeInsets.only(top: context.s(SeasonFinishedCard.badgeOverlap)),
          padding: EdgeInsets.fromLTRB(
            context.s(AppInsets.x40),
            context.s(AppInsets.x48),
            context.s(AppInsets.x40),
            context.s(AppInsets.x32),
          ),
          decoration: BoxDecoration(
            color: context.colors.background.withValues(alpha: 0.75),
            borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
            border: Border.all(color: context.colors.ctaGradient.first, width: context.s(AppBorders.x3)),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.battlePassFinishedTitle,
                style: context.textStyles.h3.copyWith(color: context.colors.textPrimary),
              ),
              SizedBox(height: context.s(AppInsets.x8)),
              Text(
                context.l10n.battlePassFinishedDescription,
                textAlign: TextAlign.center,
                style: context.textStyles.caption.copyWith(
                  color: context.colors.textPrimary.withValues(alpha: 0.6),
                ),
              ),
              SizedBox(height: context.s(AppInsets.x20)),
              SeasonDeadlinePill(deadline: deadline),
            ],
          ),
        ),
        const SeasonWarningBadge(),
      ],
    ),
  );
}
