import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The "xN" pill on a reward card.
class RewardAmountPill extends StatelessWidget {
  const RewardAmountPill({required this.amount, super.key});

  final int amount;

  @override
  Widget build(BuildContext context) => Container(
    padding: EdgeInsets.symmetric(horizontal: context.s(AppInsets.x12), vertical: context.s(AppInsets.x2)),
    decoration: BoxDecoration(
      color: context.colors.pill.withValues(alpha: 0.6),
      borderRadius: BorderRadius.circular(context.s(AppRadius.x12)),
    ),
    child: Text(
      context.l10n.amountMultiplier(amount),
      style: context.textStyles.body.copyWith(color: context.colors.textPrimary),
    ),
  );
}
