import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/models/splash_state.dart';
import 'package:iot_client_starter/iot_client_starter.dart';

class SplashComponent extends StatefulWidget {
  const SplashComponent({
    required this.channelStateWatcher,
    final Key? key,
  }) : super(key: key);

  final ChannelStateWatcher channelStateWatcher;

  @override
  State<SplashComponent> createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  final _controllerSplashState = StreamController<SplashState>();
  late final StreamSubscription _subChannelState;

  @override
  void initState() {
    _subChannelState =
        widget.channelStateWatcher.watchState().listen((final channelState) {
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
          SplashInitial() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Инициализация...',
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Theme.of(context).colorScheme.outline,
                        ),
                  ),
                ),
              ],
            ),
          SplashLoading() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Center(
                  child: CircularProgressIndicator(),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Text(
                    'Загрузка...',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ],
            ),
          SplashError() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      (snap.data! as SplashError).error,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.error,
                          ),
                    ),
                  ),
                ),
              ],
            ),
          SplashSuccess() => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      'Подключение успешно!',
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                            color: Theme.of(context).colorScheme.surfaceTint,
                          ),
                    ),
                  ),
                ),
              ],
            ),
        },
      );
}
