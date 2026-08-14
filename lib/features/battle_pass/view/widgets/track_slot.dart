import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_slot_column.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// One column of the scrolling track, fixed to the slot width.
class TrackSlot extends StatelessWidget {
  const TrackSlot({
    required this.card,
    required this.footer,
    this.width = AppLayout.trackSlot,
    super.key,
  });

  final Widget card;

  /// Pin plus its rail, or the collect-all bar for the tray.
  final Widget footer;

  /// Slot pitch in design units. The tray steps tighter than the track.
  final double width;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: context.s(width),
    child: TrackSlotColumn(
      // The pitch and the card size are independent: the tray steps tighter
      // than a card is wide, so its cards lean over their neighbours instead of
      // being squeezed to fit the step.
      card: OverflowBox(maxWidth: double.infinity, child: card),
      footer: footer,
    ),
  );
}
