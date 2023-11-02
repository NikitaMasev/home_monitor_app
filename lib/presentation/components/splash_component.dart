import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/models/loader_state.dart';
import 'package:home_monitor/presentation/models/splash_state_ui.dart';
import 'package:home_monitor/presentation/widgets/loaders/loader_entity.dart';
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
  final _controllerSplashState = StreamController<SplashStateUi>();
  late final StreamSubscription _subChannelState;
  late final IotStateRepository _iotStateRepository;

  @override
  void initState() {
    _iotStateRepository = context.read<IotStateRepository>();
    _iotStateRepository.lastState().then(_handleIotState);
    _subChannelState = _iotStateRepository.watchState().listen(_handleIotState);
    super.initState();
  }

  void _handleIotState(final IotState iotState) {
    print('SplashComponent _handleIotState $iotState');
    switch (iotState) {
      case IotLoading():
        _controllerSplashState.add(SplashUiLoading());
        break;
      case IotDisconnected():
        _controllerSplashState.add(SplashUiError(err: 'Сервер не доступен'));
        break;
      case IotError():
        _controllerSplashState.add(
          SplashUiError(
            err: 'Ошибка подключения к серверу: ${iotState.error}',
          ),
        );
        break;
      case IotReady():
        _controllerSplashState.add(SplashUiSuccess());
        Future.delayed(
          Duration.zero,
          () => context.router.replace(const HomeRoute()),
        );
        break;
    }
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
