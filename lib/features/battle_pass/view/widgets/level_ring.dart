import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_ring_painter.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// Current level inside a ring that fills with the experience of that level.
///
/// Gaining a level is played as a sequence rather than a single tween: the ring
/// runs out to full, the number flips, and only then does it start again from
/// empty. Tweening straight to the new value would send the ring *backwards*,
/// because buying a level resets the experience to zero.
class LevelRing extends StatefulWidget {
  const LevelRing({required this.pass, super.key});

  /// Ring size and thickness in design units.
  static const double size = 100;
  static const double stroke = 8;

  final BattlePass pass;

  @override
  State<LevelRing> createState() => _LevelRingState();
}

class _LevelRingState extends State<LevelRing> with SingleTickerProviderStateMixin {
  final BattlePassTrackService _service = getIt<BattlePassTrackService>();

  late final AnimationController _controller = AnimationController(vsync: this);
  late Animation<double> _fill;

  /// The value the ring was last sent to, so an update that changes nothing
  /// does not restart the animation.
  late double _from;

  /// Held back during the first leg of a level-up so the number flips at the
  /// moment the ring resets, not before it has finished running out.
  late int _level;

  double get _target => _service.levelFill(widget.pass);

  @override
  void initState() {
    super.initState();
    _from = _target;
    _level = widget.pass.level;
    _fill = AlwaysStoppedAnimation(_from);
  }

  @override
  void didUpdateWidget(LevelRing oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.pass.level > oldWidget.pass.level) {
      _playLevelUp();
    } else if (_target != _from || widget.pass.level != _level) {
      setState(() => _level = widget.pass.level);
      _animateTo(_target, AppDurations.long);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _playLevelUp() async {
    await _animateTo(1, AppDurations.ringFillOut);
    if (!mounted) return;

    setState(() => _level = widget.pass.level);
    await _animateTo(_target, AppDurations.long, from: 0);
  }

  /// Starts where the ring is standing right now, not where the last leg was
  /// headed: experience arriving mid-animation would otherwise snap the arc to
  /// the previous target before travelling on.
  Future<void> _animateTo(double target, Duration duration, {double? from}) {
    _fill = Tween<double>(begin: from ?? _fill.value, end: target).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOutCubic),
    );
    _from = target;
    _controller.duration = duration;
    return _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    final size = context.s(LevelRing.size);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Stack(
            alignment: Alignment.center,
            children: [
              AnimatedBuilder(
                animation: _fill,
                builder: (context, _) => CustomPaint(
                  size: Size.square(size),
                  painter: LevelRingPainter(
                    fill: _fill.value,
                    stroke: context.s(LevelRing.stroke),
                    trackColor: context.colors.textPrimary.withValues(alpha: 0.1),
                    progressColor: context.colors.textPrimary.withValues(alpha: 0.6),
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: AppDurations.short,
                transitionBuilder: (child, animation) => ScaleTransition(
                  scale: Tween<double>(begin: 0.6, end: 1).animate(animation),
                  child: FadeTransition(opacity: animation, child: child),
                ),
                child: Text(
                  '$_level',
                  key: ValueKey(_level),
                  style: context.textStyles.h2.copyWith(color: context.colors.textPrimary),
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: context.s(AppInsets.x8)),
        Text(
          context.l10n.progressFraction(widget.pass.xp, widget.pass.xpPerLevel),
          style: context.textStyles.caption.copyWith(
            color: context.colors.textPrimary.withValues(alpha: 0.6),
          ),
        ),
      ],
    );
  }
}
