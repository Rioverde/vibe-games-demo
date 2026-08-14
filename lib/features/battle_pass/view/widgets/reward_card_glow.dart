import 'package:flutter/widgets.dart';

/// Tier-coloured light behind the item on a reward card.
///
/// Decoration only, so it never takes a pointer: a [DecoratedBox] reports a hit
/// across its whole shape.
class RewardCardGlow extends StatelessWidget {
  const RewardCardGlow({required this.color, required this.dimmed, super.key});

  final Color color;

  /// Claimed and locked-premium cards keep a faint version of the light.
  final bool dimmed;

  @override
  Widget build(BuildContext context) => IgnorePointer(
    child: DecoratedBox(
      decoration: BoxDecoration(
        gradient: RadialGradient(
          radius: 0.75,
          colors: [
            color.withValues(alpha: dimmed ? 0.12 : 0.45),
            color.withValues(alpha: 0),
          ],
        ),
      ),
    ),
  );
}
