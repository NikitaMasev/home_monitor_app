import 'package:flutter/material.dart';
import 'package:home_monitor/di/configurator_scope.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/scroll_non_stretching.dart';
import 'package:home_monitor/presentation/theme/theme_factory.dart';

class App extends StatelessWidget {
  App(this.initializedConfig);

  final VoidCallback initializedConfig;

  final _appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) => ConfiguratorScope(
        env: Env.prod,
        logger: false,
        initialized: initializedConfig,
        child: MaterialApp.router(
          scrollBehavior: ScrollNonStretching(),
          title: 'Home Monitor',
          routerConfig: _appRouter.config(),
          debugShowCheckedModeBanner: false,
          theme: ThemeFactory.createLightTheme().getTheme(),
          darkTheme: ThemeFactory.createDarkTheme().getTheme(),
        ),
      );
}
