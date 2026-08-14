import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';

/// The quest screen drops the season artwork for a flat warm wash, so the cards
/// stay readable across the full width.
class QuestsBackground extends StatelessWidget {
  const QuestsBackground({super.key});

  @override
  Widget build(BuildContext context) => DecoratedBox(
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: context.colors.questBackdropGradient,
        stops: const [0, 0.55, 1],
      ),
    ),
  );
}
