import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/models/loader_state.dart';
import 'package:home_monitor/presentation/widgets/loaders/loading_status.dart';

class LoaderEntity extends StatelessWidget {
  const LoaderEntity({
    required this.stream,
    super.key,
    this.childIfSuccess,
  });

  final Stream<LoaderState> stream;
  final Widget? childIfSuccess;

  @override
  Widget build(final BuildContext context) => StreamBuilder(
        stream: stream,
        initialData: LoaderStateInitial(),
        builder: (final ctx, final snap) => switch (snap.data!) {
          LoaderStateInitial() => LoadingStatus(
              text: 'Инициализация...',
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          LoaderStateLoading() => const LoadingStatus(text: 'Загрузка...'),
          LoaderStateError(err: final err) => LoadingStatus(
              text: err,
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          LoaderStateSuccess() => childIfSuccess ?? LoadingStatus(
              text: 'Подключение успешно!',
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
            ),
        },
      );
}
