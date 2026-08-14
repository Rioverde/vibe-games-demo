import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:vibe_games_demo/app/router/router.dart';
import 'package:vibe_games_demo/app/view/battle_pass_scope.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) => MaterialApp.router(
    debugShowCheckedModeBanner: false,
    routerConfig: _router.config(),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    // The mockup and the season copy are Russian, so the screen ships in
    // Russian regardless of the device language. Every string goes through
    // `context.l10n`, so dropping this line hands control back to the system.
    locale: const Locale('ru'),
    scrollBehavior: const GameScrollBehavior(),
    // The cubit is scoped above the navigator so both routes share one pass:
    // the quest screen reads the same payload the main screen is showing.
    builder: (context, child) => BattlePassScope(
      // The mockup is a landscape game screen measured in pixels; letting the
      // OS font setting rescale text would drift the layout off the frame.
      child: MediaQuery.withNoTextScaling(child: child!),
    ),
  );
}

/// No scrollbars, and dragging works with a mouse as well as a finger — the
/// reward track is a game surface, not a document.
class GameScrollBehavior extends MaterialScrollBehavior {
  const GameScrollBehavior();

  @override
  Widget buildScrollbar(BuildContext context, Widget child, ScrollableDetails details) => child;

  @override
  Set<PointerDeviceKind> get dragDevices => PointerDeviceKind.values.toSet();
}
