import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:home_monitor/app.dart';
import 'package:iot_internal/iot_internal.dart';

void main() => _bootstrap(App.new);

Future<void> _bootstrap(
  final Widget Function(VoidCallback) builder,
) async {
  runZonedGuarded<void>(
    () {
      FlutterNativeSplash.preserve(
        widgetsBinding: WidgetsFlutterBinding.ensureInitialized(),
      );
      //Bloc.observer = AppBlocObserver();
      runApp(builder(FlutterNativeSplash.remove));
    },
    (final error, final stack) => log(
      error.toString(),
      stackTrace: stack,
    ),
  );

  FlutterError.onError = (final details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
}
