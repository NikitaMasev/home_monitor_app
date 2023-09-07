import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class AppRouteObserver extends AutoRouterObserver {
  @override
  void didPush(final Route route, final Route? previousRoute) {
    log('New route pushed: ${route.settings.name}');
  }

  @override
  void didInitTabRoute(
    final TabPageRoute route,
    final TabPageRoute? previousRoute,
  ) {
    log('Tab route visited: ${route.name}');
  }

  @override
  void didChangeTabRoute(
    final TabPageRoute route,
    final TabPageRoute previousRoute,
  ) {
    log('Tab route re-visited: ${route.name}');
  }
}
