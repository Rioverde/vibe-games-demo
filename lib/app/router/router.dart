import 'package:auto_route/auto_route.dart';
import 'package:vibe_games_demo/app/router/router.gr.dart';
import 'package:vibe_games_demo/app/router/router_names.dart';

/// Declares the route tree.
@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.cupertino();

  @override
  List<AutoRoute> get routes => [
    AutoRoute(
      path: AppRoutersName.battlePass.route,
      initial: true,
      page: BattlePassRoute.page,
    ),
    AutoRoute(
      path: AppRoutersName.quests.route,
      page: QuestsRoute.page,
    ),
  ];
}
