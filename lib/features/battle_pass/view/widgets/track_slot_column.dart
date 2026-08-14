import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// The vertical rhythm of the reward track: a gap, the card, then the footer
/// row that carries pins and rails.
///
/// Anything that has to line up with the track uses this instead of repeating
/// the offsets, which is what keeps the pinned final reward and the scroll
/// arrow level with the scrolling cards.
class TrackSlotColumn extends StatelessWidget {
  const TrackSlotColumn({required this.card, required this.footer, super.key});

  final Widget card;
  final Widget footer;

  @override
  Widget build(BuildContext context) => Column(
    children: [
      SizedBox(height: context.s(AppLayout.trackCardsTop)),
      Expanded(child: card),
      SizedBox(
        height: context.s(AppLayout.trackFooterHeight),
        child: Center(child: footer),
      ),
    ],
  );
}
