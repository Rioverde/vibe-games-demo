// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:vibe_games_demo/features/battle_pass/view/pages/battle_pass_screen.dart'
    as _i1;
import 'package:vibe_games_demo/features/quests/view/pages/quests_screen.dart'
    as _i2;

/// generated route for
/// [_i1.BattlePassScreen]
class BattlePassRoute extends _i3.PageRouteInfo<void> {
  const BattlePassRoute({List<_i3.PageRouteInfo>? children})
    : super(BattlePassRoute.name, initialChildren: children);

  static const String name = 'BattlePassRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i1.BattlePassScreen());
    },
  );
}

/// generated route for
/// [_i2.QuestsScreen]
class QuestsRoute extends _i3.PageRouteInfo<void> {
  const QuestsRoute({List<_i3.PageRouteInfo>? children})
    : super(QuestsRoute.name, initialChildren: children);

  static const String name = 'QuestsRoute';

  static _i3.PageInfo page = _i3.PageInfo(
    name,
    builder: (data) {
      return _i3.WrappedRoute(child: const _i2.QuestsScreen());
    },
  );
}
