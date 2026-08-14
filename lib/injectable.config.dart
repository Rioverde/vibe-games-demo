// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:vibe_games_demo/data/battle_pass/provider/battle_pass_provider.dart'
    as _i76;
import 'package:vibe_games_demo/data/battle_pass/repository/battle_pass_repository.dart'
    as _i910;
import 'package:vibe_games_demo/services/battle_pass_track_service/battle_pass_track_service.dart'
    as _i182;
import 'package:vibe_games_demo/theme/colors_scheme.dart' as _i136;
import 'package:vibe_games_demo/theme/dark_colors_scheme.dart' as _i591;
import 'package:vibe_games_demo/theme/text_style.dart' as _i113;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i113.AppTextStyles>(() => _i113.AppTextStyles());
    gh.lazySingleton<_i182.BattlePassTrackService>(
      () => const _i182.BattlePassTrackService(),
    );
    gh.lazySingleton<_i910.BattlePassRepository>(
      () => _i76.BattlePassProvider(),
    );
    gh.lazySingleton<_i136.ColorsScheme>(() => _i591.DarkColorsScheme());
    return this;
  }
}
