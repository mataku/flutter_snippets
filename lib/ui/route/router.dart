import 'package:flutter/material.dart';
import 'package:flutter_snippets/feature/camera/camera_screen.dart';
import 'package:flutter_snippets/ui/screen/home_screen.dart';
import 'package:go_router/go_router.dart';

part 'router.g.dart';

final routerProvider = GoRouter(
  routes: $appRoutes,
  initialLocation: HomeRoute.path,
);

@TypedGoRoute<HomeRoute>(
  path: HomeRoute.path,
  routes: <TypedGoRoute<GoRouteData>>[
    TypedGoRoute<CameraRoute>(path: CameraRoute.path),
  ],
)
class HomeRoute extends GoRouteData with _$HomeRoute {
  const HomeRoute();

  static const path = '/';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const HomeScreen();
  }
}

@TypedGoRoute<CameraRoute>(path: CameraRoute.path)
class CameraRoute extends GoRouteData with _$CameraRoute {
  const CameraRoute();

  static const path = '/camera';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const CameraScreen();
  }
}
