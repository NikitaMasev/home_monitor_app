sealed class LoaderState {}

class LoaderStateInitial implements LoaderState {}

class LoaderStateLoading implements LoaderState {}

class LoaderStateError implements LoaderState {
  LoaderStateError({required this.err});

  final String err;
}

class LoaderStateSuccess implements LoaderState {}
