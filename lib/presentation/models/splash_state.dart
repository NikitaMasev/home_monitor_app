sealed class SplashState {}

class SplashInitial implements SplashState {}

class SplashLoading implements SplashState {}

class SplashError implements SplashState {
  SplashError({required this.error});

  final String error;
}

class SplashSuccess implements SplashState {}
