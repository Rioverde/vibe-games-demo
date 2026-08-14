import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:vibe_games_demo/injectable.config.dart';

final GetIt getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();
