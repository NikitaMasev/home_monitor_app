import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/models/splash_state.dart';
import 'package:home_monitor/presentation/widgets/loaders/loading_status.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:provider/provider.dart';

class SplashComponent extends StatefulWidget {
  const SplashComponent({
    final Key? key,
  }) : super(key: key);

  @override
  State<SplashComponent> createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  final _controllerSplashState = StreamController<SplashState>();
  late final StreamSubscription _subChannelState;
  late final ChannelStateWatcher _channelStateWatcher;

  @override
  void initState() {
    _channelStateWatcher = context.read<ChannelStateWatcher>();

    _subChannelState =
        _channelStateWatcher.watchState().listen((final channelState) {
      switch (channelState) {
        case ChannelInitial():
          break;
        case ChannelLoading():
          _controllerSplashState.add(SplashLoading());
          break;
        case ChannelDisconnected():
          _controllerSplashState.add(SplashError(error: 'Сервер не доступен'));
          break;
        case ChannelError():
          _controllerSplashState.add(
            SplashError(
              error: 'Ошибка подключения к серверу: ${channelState.error}',
            ),
          );
          break;
        case ChannelReady():
          _controllerSplashState.add(SplashSuccess());
          Future.delayed(
            const Duration(seconds: 1),
            () => context.router.push(const HomeRoute()),
          );
          break;
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _subChannelState.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder(
        stream: _controllerSplashState.stream,
        initialData: SplashInitial(),
        builder: (final ctx, final snap) => switch (snap.data!) {
          SplashInitial() => LoadingStatus(
              text: 'Инициализация...',
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.outline,
                  ),
            ),
          SplashLoading() => const LoadingStatus(text: 'Загрузка...'),
          SplashError() => LoadingStatus(
              text: (snap.data! as SplashError).error,
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.error,
                  ),
            ),
          SplashSuccess() => LoadingStatus(
              text: 'Подключение успешно!',
              textStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Theme.of(context).colorScheme.surfaceTint,
                  ),
            ),
        },
      );
}
