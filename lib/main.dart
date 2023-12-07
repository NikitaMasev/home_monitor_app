import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_monitor/app.dart';
import 'package:home_monitor/internal/theme/theme_bar_controller.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() => _bootstrap(App.new);

Future<void> _bootstrap(
  final Widget Function(VoidCallback) builder,
) async {
  runZonedGuarded<void>(
    () async {
      await SentryFlutter.init(
        (final options) {
          options.dsn = const String.fromEnvironment('SENTRY_KEY');
        },
      );
      FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
      );
      ThemeBarController.onSplashFlow();
      //Bloc.observer = AppBlocObserver();
      runApp(builder(FlutterNativeSplash.remove));
    },
    (final error, final stack) async {
      log(
        error.toString(),
        stackTrace: stack,
      );
      await Sentry.captureException(error, stackTrace: stack);
    },
  );

  FlutterError.onError = (final details) {
    Sentry.captureException(details, stackTrace: details.stack);
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}
