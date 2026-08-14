import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_scroll_edge_fade.dart';
import 'package:vibe_games_demo/common/ui/components/vg_circle_icon_button.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/reward_track_row.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_final_level.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/track_slot_column.dart';
import 'package:vibe_games_demo/generated/assets.gen.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// The bottom strip: reward cards, level pins and the rail under them.
///
/// A [Row] of the scrolling levels and the pinned final one, so the space the
/// final card needs is whatever it actually measures instead of a reserved
/// width someone has to keep in sync with it.
class RewardTrack extends StatefulWidget {
  const RewardTrack({required this.pass, super.key});

  final BattlePass pass;

  @override
  State<RewardTrack> createState() => _RewardTrackState();
}

class _RewardTrackState extends State<RewardTrack> with TickerProviderStateMixin {
  final ScrollController _controller = ScrollController();
  final BattlePassTrackService _service = getIt<BattlePassTrackService>();

  late final AnimationController _entrance = AnimationController(
    vsync: this,
    duration: AppDurations.trackEntrance,
  );

  /// The rail is driven from here rather than from each segment, so the whole
  /// row moves on one clock and the fill reads as a single front.
  late final AnimationController _railController = AnimationController(
    vsync: this,
    duration: AppDurations.medium,
  );
  late Animation<double> _rail = AlwaysStoppedAnimation(_service.railProgress(widget.pass));

  @override
  void initState() {
    super.initState();
    // The row always opens at its first card. Auto-scrolling to the player's
    // level was an invention of mine, not something the mockup asks for, and a
    // track that opens somewhere in the middle reads as broken layout.
    _entrance.forward();
  }

  @override
  void didUpdateWidget(RewardTrack oldWidget) {
    super.didUpdateWidget(oldWidget);

    final target = _service.railProgress(widget.pass);
    if (target == _rail.value) return;

    // Begins where the rail is standing, not where the last run was headed, so
    // experience arriving mid-animation carries on instead of snapping ahead.
    _rail = Tween<double>(begin: _rail.value, end: target).animate(
      CurvedAnimation(parent: _railController, curve: Curves.easeOutCubic),
    );
    _railController.forward(from: 0);
  }

  @override
  void dispose() {
    _entrance.dispose();
    _railController.dispose();
    _controller.dispose();
    super.dispose();
  }

  /// Scrolls by whole cards so the row always comes to rest on a slot.
  void _nudge() {
    if (!_controller.hasClients) return;
    _controller.animateTo(
      _service.nudgeOffset(
        current: _controller.offset,
        slotWidth: context.s(AppLayout.trackSlot),
        minExtent: _controller.position.minScrollExtent,
        maxExtent: _controller.position.maxScrollExtent,
      ),
      duration: AppDurations.short,
      curve: Curves.easeOutCubic,
    );
  }

  @override
  Widget build(BuildContext context) {
    final finalLevel = _service.finalLevel(widget.pass);

    return SizedBox(
      height: context.s(AppLayout.trackHeight),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Stack(
              children: [
                VGScrollEdgeFade(
                  controller: _controller,
                  fade: AppLayout.trackEdgeFade,
                  child: RewardTrackRow(
                    pass: widget.pass,
                    controller: _controller,
                    entrance: _entrance,
                    rail: _rail,
                  ),
                ),
                // Rides the same vertical rhythm as the cards, so it stays level
                // with them without being placed by hand.
                TrackSlotColumn(
                  card: Align(
                    alignment: Alignment.centerRight,
                    child: VGCircleIconButton.small(
                      icon: Assets.icons.arrowRight,
                      onTap: _nudge,
                    ),
                  ),
                  footer: const SizedBox.shrink(),
                ),
              ],
            ),
          ),
          if (finalLevel != null) TrackFinalLevel(level: finalLevel, pass: widget.pass),
        ],
      ),
    );
  }
}
