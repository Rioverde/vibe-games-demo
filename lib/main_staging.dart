import 'package:vibe_games_demo/app/app.dart';
import 'package:vibe_games_demo/bootstrap.dart';

Future<void> main() async {
  await bootstrap(() => const App());
}
