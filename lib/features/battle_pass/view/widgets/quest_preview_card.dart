import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/common/ui/extensions/ui_context_extension.dart';
import 'package:vibe_games_demo/common/utils/battle_pass_actions_mixin.dart';
import 'package:vibe_games_demo/data/battle_pass/models/quest/quest.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/quest_claim_button.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/quest_preview_dots.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/quest_preview_header.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/quests_button.dart';
import 'package:vibe_games_demo/theme/app_dimens.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// The quest teaser on the main screen.
///
/// The mockup draws five dots under the text but only one quest, so the card is
/// built as a carousel: it rotates through the quest list on its own. That is
/// what the dots are for, and it gives the left half of the screen something
/// that moves without demanding a tap.
class QuestPreviewCard extends StatefulWidget {
  const QuestPreviewCard({required this.quests, required this.onOpenQuests, super.key});

  /// Card size in design units.
  static const double width = 400;
  static const double height = 400;

  /// The mockup draws five dots under the card, so it advertises at most
  /// five quests.
  static const int slots = 5;

  final List<Quest> quests;
  final VoidCallback onOpenQuests;

  @override
  State<QuestPreviewCard> createState() => _QuestPreviewCardState();
}

class _QuestPreviewCardState extends State<QuestPreviewCard> with BattlePassActionsMixin {
  Timer? _timer;
  int _index = 0;

  /// Never advertise more quests than the dots can represent.
  List<Quest> get _visible => widget.quests.take(QuestPreviewCard.slots).toList();

  @override
  void initState() {
    super.initState();
    _restart();
  }

  @override
  void didUpdateWidget(QuestPreviewCard oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.quests.length != widget.quests.length) {
      _index = 0;
      _restart();
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _restart() {
    _timer?.cancel();
    if (_visible.length < 2) return;
    _timer = Timer.periodic(
      AppDurations.questRotation,
      (_) => setState(() => _index = (_index + 1) % _visible.length),
    );
  }

  @override
  Widget build(BuildContext context) {
    final quests = _visible;
    if (quests.isEmpty) return const SizedBox.shrink();

    final quest = quests[_index.clamp(0, quests.length - 1)];
    final radius = context.s(AppRadius.x30);

    return SizedBox(
      width: context.s(QuestPreviewCard.width),
      height: context.s(QuestPreviewCard.height),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          QuestPreviewHeader(quest: quest, radius: radius),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: context.colors.panel,
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(radius)),
              ),
              padding: EdgeInsets.fromLTRB(
                context.s(AppInsets.x40),
                context.s(AppInsets.x24),
                context.s(AppInsets.x40),
                context.s(AppInsets.x36),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: AppDurations.short,
                      child: Text(
                        quest.text,
                        key: ValueKey(quest.id),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        style: context.textStyles.caption.copyWith(
                          color: context.colors.textPrimary.withValues(alpha: 0.6),
                        ),
                      ),
                    ),
                  ),
                  QuestPreviewDots(count: quests.length, active: _index),
                  SizedBox(height: context.s(AppInsets.x26)),
                  // A finished quest turns the button into the one that takes
                  // its experience — the frame at max level shows this state.
                  if (quest.isCompleted && !quest.claimed)
                    QuestClaimButton(onTap: () => claimQuest(context, quest.id))
                  else
                    QuestsButton(onTap: widget.onOpenQuests),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
