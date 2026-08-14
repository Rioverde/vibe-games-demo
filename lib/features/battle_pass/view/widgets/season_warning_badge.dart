import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// The gold exclamation mark straddling the top border of the finished card.
class SeasonWarningBadge extends StatelessWidget {
  const SeasonWarningBadge({super.key});

  @override
  Widget build(BuildContext context) => Container(
    width: context.s(56),
    height: context.s(56),
    alignment: Alignment.center,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: context.colors.premiumGradient),
      borderRadius: BorderRadius.circular(context.s(AppRadius.x18)),
    ),
    child: Text(
      '!',
      style: context.textStyles.h3.copyWith(color: context.colors.textOnAccent),
    ),
  );
}
