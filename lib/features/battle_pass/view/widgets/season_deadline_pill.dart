import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/components/vg_countdown_text.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// Countdown to the moment the remaining rewards stop being claimable.
class SeasonDeadlinePill extends StatelessWidget {
  const SeasonDeadlinePill({required this.deadline, super.key});

  final DateTime deadline;

  @override
  Widget build(BuildContext context) => Container(
    height: context.s(56),
    padding: EdgeInsets.symmetric(horizontal: context.s(AppInsets.x30)),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: context.colors.premiumGradient),
      borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
    ),
    child: VGCountdownText(
      deadline: deadline,
      style: context.textStyles.body.copyWith(color: context.colors.textOnAccent),
    ),
  );
}
