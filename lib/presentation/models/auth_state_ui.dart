sealed class AuthStateUi {}

class AuthStateUiInitial implements AuthStateUi {}

class AuthStateUiLoading implements AuthStateUi {}

class AuthStateUiError implements AuthStateUi {
  AuthStateUiError({required this.err});

  final String err;
}

class AuthStateUiSuccess implements AuthStateUi {}
