/// Every timing the interface animates on.
///
/// Gathered so the screen has one tempo instead of a different guess at each
/// call site, and so a designer asking "make it snappier" has one file to open.
abstract final class AppDurations {
  /// A surface answering a finger.
  static const Duration press = Duration(milliseconds: 100);

  /// Cross-fades and state swaps.
  static const Duration short = Duration(milliseconds: 300);

  /// Bars and rails travelling to a new value.
  static const Duration medium = Duration(milliseconds: 420);

  /// The level ring filling up.
  static const Duration long = Duration(milliseconds: 600);

  /// First leg of a level-up: the ring runs out to full before it resets.
  static const Duration ringFillOut = Duration(milliseconds: 450);

  /// Whole run of the track's staggered entrance, first card to last.
  static const Duration trackEntrance = Duration(milliseconds: 900);

  /// The hero's breathing loop.
  static const Duration heroBreath = Duration(seconds: 4);

  /// How often a countdown repaints.
  static const Duration tick = Duration(seconds: 1);

  /// How long the quest preview card holds one quest before turning the page.
  static const Duration questRotation = Duration(seconds: 5);
}
