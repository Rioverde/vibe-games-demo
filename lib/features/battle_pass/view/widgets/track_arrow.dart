import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_arrow_painter.dart';

/// The faint chevron between two reward cards.
///
/// Figma puts one just ahead of every level, tinted to a fifth of the text
/// colour: it reads as "the track carries on this way" without competing with
/// the cards themselves.
class TrackArrow extends StatelessWidget {
  const TrackArrow({super.key});

  static const double width = 12;
  static const double height = 20;

  /// How far it sits ahead of the card it belongs to, in design units.
  static const double lead = 2;

  /// The opacity the Figma fill carries.
  static const double opacity = 0.2;

  @override
  Widget build(BuildContext context) => CustomPaint(
    size: Size(context.s(width), context.s(height)),
    painter: TrackArrowPainter(
      color: context.colors.textPrimary.withValues(alpha: opacity),
    ),
  );
}
