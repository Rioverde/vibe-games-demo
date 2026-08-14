import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// Gives every tappable surface the same press feedback.
///
/// The mockup has no pressed states, so this is a deliberate addition: a game
/// UI that does not answer the finger feels dead, and one widget keeps that
/// answer identical everywhere instead of each button inventing its own.
class VGPressable extends StatefulWidget {
  const VGPressable({
    required this.child,
    this.onTap,
    this.scale = 0.95,
    this.disabledOpacity = 1.0,
    super.key,
  });

  final Widget child;
  final VoidCallback? onTap;

  /// How far the surface shrinks while held.
  final double scale;

  /// Opacity applied when [onTap] is null.
  final double disabledOpacity;

  @override
  State<VGPressable> createState() => _VGPressableState();
}

class _VGPressableState extends State<VGPressable> {
  bool _down = false;

  bool get _enabled => widget.onTap != null;

  void _setDown({required bool value}) {
    if (!_enabled || _down == value) return;
    setState(() => _down = value);
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
    onTapDown: (_) => _setDown(value: true),
    onTapUp: (_) => _setDown(value: false),
    onTapCancel: () => _setDown(value: false),
    onTap: widget.onTap,
    behavior: HitTestBehavior.opaque,
    child: AnimatedScale(
      scale: _down ? widget.scale : 1,
      duration: AppDurations.press,
      curve: Curves.easeOut,
      child: AnimatedOpacity(
        opacity: _enabled ? 1 : widget.disabledOpacity,
        duration: AppDurations.short,
        child: widget.child,
      ),
    ),
  );
}
