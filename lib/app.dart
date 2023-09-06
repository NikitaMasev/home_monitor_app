import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:home_monitor/di/audio_service_scope.dart';
import 'package:home_monitor/di/configurator_scope.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/theme_scope.dart';
import 'package:home_monitor/internal/routes/router.gr.dart';
import 'package:home_monitor/presentation/localization/l10n.dart';
import 'package:theme_provider/theme_provider.dart';

class App extends StatelessWidget {
  App(this.initializedConfig);

  final VoidCallback initializedConfig;

  final _appRouter = AppRouter();

  @override
  Widget build(final BuildContext context) => ThemeScope(
        child: ThemeConsumer(
          child: Builder(
            builder: (final ctx) => ConfiguratorScope(
              env: Env.dev,
              logger: true,
              initialized: initializedConfig,
              child: MaterialApp.router(
                builder: (final context, final child) => AudioServiceScope(
                  child: child!,
                ),
                title: 'Home monitor',
                routerDelegate: _appRouter.delegate(),
                routeInformationParser: _appRouter.defaultRouteParser(),
                debugShowCheckedModeBanner: false,
                theme: ThemeProvider.themeOf(ctx).data,
                localizationsDelegates: const [
                  AppLocalizations.delegate,
                  GlobalMaterialLocalizations.delegate,
                ],
                supportedLocales: AppLocalizations.supportedLocales,
              ),
            ),
          ),
        ),
      );
}
