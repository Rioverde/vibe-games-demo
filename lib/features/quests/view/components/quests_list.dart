import 'package:flutter/material.dart';
import 'package:vibe_games_demo/common/ui/atoms/vg_scroll_edge_fade.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/features/quests/view/widgets/quest_card.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';
import 'package:vibe_games_demo/theme/app_layout.dart';

/// The horizontal row of quest cards.
///
/// Wrapped in the same edge fade the reward track uses: the viewport cuts the
/// last card on a straight vertical line, which reads as a glitch instead of as
/// a row that carries on past the screen.
class QuestsList extends StatefulWidget {
  const QuestsList({required this.quests, super.key});

  final List<Quest> quests;

  @override
  State<QuestsList> createState() => _QuestsListState();
}

class _QuestsListState extends State<QuestsList> {
  final ScrollController _controller = ScrollController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => VGScrollEdgeFade(
    controller: _controller,
    fade: AppLayout.trackEdgeFade,
    child: ListView.separated(
      controller: _controller,
      scrollDirection: Axis.horizontal,
      // See RewardTrackRow: a null padding here would inherit the display
      // cutout inset from MediaQuery.
      padding: EdgeInsets.zero,
      itemCount: widget.quests.length,
      separatorBuilder: (_, _) => SizedBox(width: context.s(AppInsets.x32)),
      itemBuilder: (context, index) => QuestCard(quest: widget.quests[index]),
    ),
  );
}
