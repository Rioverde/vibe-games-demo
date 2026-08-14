import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';

/// Formatting for the season and quest countdowns.
extension DurationExtension on Duration {
  /// Renders the time left as "15д 12ч 42м".
  ///
  /// Below an hour the seconds start showing — the last stretch is the one the
  /// player actually watches.
  String countdown(BuildContext context) {
    if (isNegative) return context.l10n.countdownFinished;

    final days = inDays;
    final hours = inHours % 24;
    final minutes = inMinutes % 60;

    if (days > 0) return context.l10n.countdownDays(days, hours, minutes);
    if (hours > 0) return context.l10n.countdownHours(hours, minutes);
    return context.l10n.countdownMinutes(minutes, inSeconds % 60);
  }
}

/// The same countdown, starting from an absolute deadline.
///
/// The payload carries absolute timestamps, so the remaining time is computed
/// at render rather than shipped as a string — a screen left in the background
/// would otherwise keep showing a stale value.
extension DeadlineExtension on DateTime {
  String countdown(BuildContext context) => difference(DateTime.now()).countdown(context);
}
