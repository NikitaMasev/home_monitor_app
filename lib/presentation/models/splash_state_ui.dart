sealed class SplashStateUi {}

class SplashUiInitial implements SplashStateUi {}

class SplashUiLoading implements SplashStateUi {}

class SplashUiError implements SplashStateUi {
  SplashUiError({required this.err});

  final String err;
}

class SplashUiSuccess implements SplashStateUi {}
