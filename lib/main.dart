import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_monitor/app.dart';
import 'package:home_monitor/internal/theme/theme_bar_controller.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

void main() => _bootstrap(App.new);

Future<void> _bootstrap(
  final Widget Function(VoidCallback) builder,
) async {
  await SentryFlutter.init(
    (final options) {
      options.dsn =
          'https://b5ecd5860e2289d949a569d3ad12bf33@o4505974572318720.ingest.sentry.io/4505974944628736';
      // Set tracesSampleRate to 1.0 to capture 100% of transactions for performance monitoring.
      // We recommend adjusting this value in production.
      options.tracesSampleRate = 1.0;
    },
    appRunner: () {
      FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
      );
      ThemeBarController.onSplashFlow();
      Bloc.observer = AppBlocObserver();
      runApp(builder(FlutterNativeSplash.remove));
    },
  );

/*  runZonedGuarded<void>(
    () {
      FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
      );
      ThemeBarController.onSplashFlow();
      Bloc.observer = AppBlocObserver();
      runApp(builder(FlutterNativeSplash.remove));
    },
    (final error, final stack) async {
      log(
      error.toString(),
      stackTrace: stack,
    );
      await Sentry.captureException(error, stackTrace: stack);
    },
  );*/

  FlutterError.onError = (final details) {
    Sentry.captureException(details, stackTrace: details.stack);
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}
