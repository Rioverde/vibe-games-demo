/// The frame the screen is measured against, and the few offsets that more than
/// one widget has to agree on.
///
/// Sizes that belong to a single widget live on that widget instead — a card
/// knows how wide a card is. What is left here is genuinely shared: the design
/// frame itself, the column the content sits in, and the vertical rhythm the
/// reward track shares with everything that has to line up with it.
abstract final class AppLayout {
  // ─── Design frame ────────────────────────────────────────────────────────
  /// The Figma frame every size in the feature code is measured against.
  static const double frameWidth = 2320;
  static const double frameHeight = 1080;

  // ─── Content column ──────────────────────────────────────────────────────
  static const double contentInsetLeft = 346;
  static const double contentInsetRight = 80;
  static const double contentInsetTop = 37;
  static const double contentInsetBottom = 50;

  /// Height reserved for the info bar row, so the band below it starts where
  /// the mockup puts it. The ring plus its caption needs a little more than the
  /// 124 the Figma node reports.
  static const double topBarHeight = 140;

  /// Offsets inside the middle band, measured from the top of that band.
  static const double questCardTopInset = 43;
  static const double promoTopInset = 190;

  /// Distance from the top of the screen to the hero artwork.
  ///
  /// The hero is its own layer: in the mockup it starts above the middle band
  /// and ends below it, overlapping both the info bar row and the reward track.
  static const double heroTopInset = 105;

  /// The mockup centres the hero slightly right of the screen middle, clear of
  /// the navigation rail.
  static const double heroAlignmentX = 0.09;

  // ─── Reward track rhythm ─────────────────────────────────────────────────
  /// One column of the track, and the vertical bands inside it.
  static const double trackHeight = 360;
  static const double trackSlot = 234;

  /// The tray packs tighter than the track: Figma steps its cards by 202
  /// against the track's 234, so they overlap a little.
  static const double traySlot = 202;

  /// Width of the "collect all" bar, and how far into the tray it starts.
  static const double trayBarWidth = 636;

  static const double trayBarInset = 64;
  static const double trackCardsTop = 64;
  static const double trackFooterHeight = 72;

  /// How wide the track fades out at its edges. The row is clipped by its
  /// viewport, and a hard cut there reads as a glitch.
  static const double trackEdgeFade = 110;

  /// How many slots one tap on the track arrow advances.
  static const int trackNudgeSlots = 3;
}
