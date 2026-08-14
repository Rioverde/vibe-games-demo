import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/extensions/duration_extension.dart';
import 'package:vibe_games_demo/common/utils/periodic_rebuild_mixin.dart';

/// A deadline rendered as "15д 12ч 42м" and kept ticking.
class VGCountdownText extends StatefulWidget {
  const VGCountdownText({required this.deadline, required this.style, super.key});

  final DateTime deadline;
  final TextStyle style;

  @override
  State<VGCountdownText> createState() => _VGCountdownTextState();
}

class _VGCountdownTextState extends State<VGCountdownText> with PeriodicRebuildMixin {
  @override
  Widget build(BuildContext context) => Text(
    widget.deadline.countdown(context),
    style: widget.style,
    maxLines: 1,
  );
}
