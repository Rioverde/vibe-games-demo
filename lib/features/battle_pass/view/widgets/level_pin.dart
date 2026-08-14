import 'dart:math' as math;

import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// The diamond under a reward card carrying the level number.
///
/// Reached levels sit on the track colour, the rest stay neutral, so the row of
/// pins doubles as a coarse progress read-out.
class LevelPin extends StatelessWidget {
  const LevelPin({required this.number, required this.reached, super.key});

  static const double size = 60;

  final int number;
  final bool reached;

  @override
  Widget build(BuildContext context) => SizedBox(
    width: context.s(LevelPin.size),
    height: context.s(LevelPin.size),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Transform.rotate(
          angle: math.pi / 4,
          child: AnimatedContainer(
            duration: AppDurations.short,
            decoration: BoxDecoration(
              color: reached ? context.colors.track : context.colors.levelPin,
              borderRadius: BorderRadius.circular(context.s(AppRadius.x14)),
            ),
          ),
        ),
        Text(
          '$number',
          style: context.textStyles.caption.copyWith(color: context.colors.textPrimary),
        ),
      ],
    ),
  );
}
