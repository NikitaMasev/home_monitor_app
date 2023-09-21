import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/models/loader_state.dart';
import 'package:home_monitor/presentation/models/splash_state_ui.dart';
import 'package:home_monitor/presentation/widgets/loaders/loader_entity.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:provider/provider.dart';

class SplashComponent extends StatefulWidget {
  const SplashComponent({
    required this.channelRunner,
    final Key? key,
  }) : super(key: key);
  final Runnable channelRunner;

  @override
  State<SplashComponent> createState() => _SplashComponentState();
}

class _SplashComponentState extends State<SplashComponent> {
  final _controllerSplashState = StreamController<SplashStateUi>();
  late final StreamSubscription _subChannelState;
  late final ChannelStateWatcher _channelStateWatcher;

  @override
  void initState() {
    _channelStateWatcher = context.read<ChannelStateWatcher>();

    _subChannelState = _channelStateWatcher.watchState().listen(
      (final channelState) {
        switch (channelState) {
          case ChannelInitial():
            break;
          case ChannelLoading():
            _controllerSplashState.add(SplashUiLoading());
            break;
          case ChannelDisconnected():
            _controllerSplashState
                .add(SplashUiError(err: 'Сервер не доступен'));
            break;
          case ChannelError():
            _controllerSplashState.add(
              SplashUiError(
                err: 'Ошибка подключения к серверу: ${channelState.error}',
              ),
            );
            break;
          case ChannelReady():
            _controllerSplashState.add(SplashUiSuccess());
            Future.delayed(
              Duration.zero,
              () => context.router.push(const HomeRoute()),
            );
            break;
        }
      },
    );
    widget.channelRunner.run();
    super.initState();
  }

  @override
  void dispose() {
    _subChannelState.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => LoaderEntity(
        stream: _controllerSplashState.stream.map(
          (final uiState) => switch (uiState) {
            SplashUiInitial() => LoaderStateInitial(),
            SplashUiLoading() => LoaderStateLoading(),
            SplashUiError() => LoaderStateError(err: uiState.err),
            SplashUiSuccess() => LoaderStateSuccess(),
          },
        ),
      );
}
