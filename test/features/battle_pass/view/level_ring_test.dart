import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vibe_games_demo/data/battle_pass/models/battle_pass/battle_pass.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_ring.dart';
import 'package:vibe_games_demo/features/battle_pass/view/widgets/level_ring_painter.dart';
import 'package:vibe_games_demo/injectable.dart';
import 'package:vibe_games_demo/l10n/l10n.dart';
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart';
import 'package:vibe_games_demo/theme/colors_scheme.dart';
import 'package:vibe_games_demo/theme/dark_colors_scheme.dart';
import 'package:vibe_games_demo/theme/text_style.dart';

BattlePass passAt({required int level, required int xp}) =>
    BattlePass(level: level, maxLevel: 10, xp: xp, xpPerLevel: 1000);

/// Reads the fill the ring is currently painting.
double paintedFill(WidgetTester tester) {
  final paint = tester.widget<CustomPaint>(
    find.descendant(of: find.byType(LevelRing), matching: find.byType(CustomPaint)).first,
  );
  return (paint.painter! as LevelRingPainter).fill;
}

Future<void> pumpRing(WidgetTester tester, BattlePass pass) => tester.pumpWidget(
  MaterialApp(
    locale: const Locale('ru'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    home: Scaffold(
      body: Center(child: LevelRing(pass: pass)),
    ),
  ),
);

void main() {
  setUpAll(() {
    getIt
      ..registerLazySingleton<ColorsScheme>(DarkColorsScheme.new)
      ..registerLazySingleton<AppTextStyles>(AppTextStyles.new)
      ..registerLazySingleton<BattlePassTrackService>(BattlePassTrackService.new);
  });

  tearDownAll(getIt.reset);

  testWidgets('starts on the experience it was given', (tester) async {
    await pumpRing(tester, passAt(level: 2, xp: 500));

    expect(paintedFill(tester), 0.5);
    expect(find.text('2'), findsOneWidget);
  });

  testWidgets('a level-up runs the ring out to full before resetting it', (tester) async {
    await pumpRing(tester, passAt(level: 2, xp: 500));

    // Buying a level bumps the number and zeroes the experience.
    await pumpRing(tester, passAt(level: 3, xp: 0));
    await tester.pump(const Duration(milliseconds: 200));

    // Mid-flight the ring must be climbing towards full, not falling to zero.
    expect(paintedFill(tester), greaterThan(0.5));

    await tester.pumpAndSettle();
    expect(paintedFill(tester), 0);
    expect(find.text('3'), findsOneWidget);
    expect(find.text('2'), findsNothing);
  });

  testWidgets('progress inside the same level animates straight to the value', (tester) async {
    await pumpRing(tester, passAt(level: 2, xp: 200));
    await tester.pumpAndSettle();

    await pumpRing(tester, passAt(level: 2, xp: 800));
    await tester.pumpAndSettle();

    expect(paintedFill(tester), closeTo(0.8, 0.001));
  });

  testWidgets('the max level holds a full ring', (tester) async {
    await pumpRing(tester, passAt(level: 10, xp: 0));
    await tester.pumpAndSettle();

    expect(paintedFill(tester), 1);
  });
}
