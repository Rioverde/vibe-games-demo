import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:vibe_games_demo/theme/app_durations.dart';

/// Repaints a widget on a fixed interval.
///
/// Used by everything that renders "time left": the value is derived from an
/// absolute deadline, so the widget only needs a heartbeat, not its own state.
mixin PeriodicRebuildMixin<T extends StatefulWidget> on State<T> {
  Timer? _timer;

  /// How often the widget repaints. Override for a slower heartbeat.
  Duration get rebuildInterval => AppDurations.tick;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(rebuildInterval, (_) {
      if (mounted) setState(() {});
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
