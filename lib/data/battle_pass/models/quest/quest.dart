import 'package:freezed_annotation/freezed_annotation.dart';

part 'quest.freezed.dart';
part 'quest.g.dart';

@freezed
sealed class Quest with _$Quest {
  const factory Quest({
    /// id of the quest
    @Default(0) int id,

    /// condition text, e.g. "Использовать предмет 10 раз"
    @Default('') String text,

    /// how much battle pass experience it grants
    @Default(0) int xpReward,

    /// current progress
    @Default(0) int progress,

    /// target value; progress/goal drives the fraction and the bar
    @Default(0) int goal,

    /// the experience has been collected
    @Default(false) bool claimed,

    /// unix time the quest expires at; 0 never expires
    @Default(0) int expiresAt,
  }) = _Quest;

  const Quest._();

  factory Quest.fromJson(Map<String, dynamic> json) => _$QuestFromJson(json);

  factory Quest.mock() => const Quest(
    id: 1,
    text: 'Используйте определенный предмет (Энергетик) 10 раз в классическом режиме.',
    xpReward: 25,
    progress: 1,
    goal: 3,
  );

  bool get isCompleted => progress >= goal;

  /// 0..1 fill of the progress bar, guarded against a zero goal.
  double get fill => goal <= 0 ? 0 : (progress / goal).clamp(0.0, 1.0);
}
