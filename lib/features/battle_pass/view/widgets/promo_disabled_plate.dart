import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';

/// "Достигнут максимальный уровень" — a label where the button used to be, so
/// the promo column keeps its rhythm instead of collapsing.
class PromoDisabledPlate extends StatelessWidget {
  const PromoDisabledPlate({required this.text, super.key});

  final String text;

  @override
  Widget build(BuildContext context) => Container(
    height: context.s(100),
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(horizontal: context.s(AppInsets.x40)),
    decoration: BoxDecoration(
      // Darkened against the artwork: a 10% white plate alone is unreadable
      // over the bright season background.
      color: context.colors.pill.withValues(alpha: 0.55),
      borderRadius: BorderRadius.circular(context.s(AppRadius.x30)),
    ),
    child: Text(
      text,
      textAlign: TextAlign.center,
      style: context.textStyles.body.copyWith(
        color: context.colors.textPrimary.withValues(alpha: 0.4),
      ),
    ),
  );
}
