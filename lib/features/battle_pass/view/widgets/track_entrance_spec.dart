/// How the reward track deals itself out.
///
/// Lives beside the widgets that play it rather than in a global bag: these
/// numbers describe one animation and nothing else refers to them.
abstract final class TrackEntranceSpec {
  /// Delay between two neighbouring cards, as a share of the whole run.
  static const double stagger = 0.06;

  /// Share of the run a single card spends animating.
  static const double cardShare = 0.5;

  /// How far a card travels up as it appears, in design units.
  static const double rise = 40;

  /// Scale a card starts from as it appears.
  static const double scale = 0.9;

  /// How far the selected card lifts above the row, in design units.
  static const double selectedLift = 12;
}
