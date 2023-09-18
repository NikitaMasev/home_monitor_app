import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
        env: Env.dev,
        logger: true,
        initialized: initializedConfig,
        child: Builder(
          builder: (final ctx) {
            final isLightTheme = MediaQuery.of(context).platformBrightness==Brightness.light;

            if (isLightTheme) {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.light,
                  statusBarIconBrightness: Brightness.dark,
                  systemNavigationBarColor: Color(0xFFE5EEF3),
                  systemNavigationBarIconBrightness: Brightness.dark,
                ),
              );
            } else {
              SystemChrome.setSystemUIOverlayStyle(
                const SystemUiOverlayStyle(
                  statusBarColor: Colors.transparent,
                  statusBarBrightness: Brightness.dark,
                  statusBarIconBrightness: Brightness.light,
                  systemNavigationBarColor: Color(0xFF1E2A30),
                  systemNavigationBarIconBrightness: Brightness.light,
                ),
              );
            }
            return MaterialApp.router(
              scrollBehavior: ScrollNonStretching(),
              title: 'Home Monitor',
              routerConfig: _appRouter.config(),
              debugShowCheckedModeBanner: false,
              theme: ThemeFactory.createLightTheme().getTheme(),
              darkTheme: ThemeFactory.createDarkTheme().getTheme(),
            );
          },
        ),
      );
}
