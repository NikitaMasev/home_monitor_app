import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/models/devices_state_ui.dart';
import 'package:home_monitor/presentation/widgets/devices_builder.dart';
import 'package:home_monitor/presentation/widgets/loaders/loading_status.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';
import 'package:provider/provider.dart';

class DevicesComponent extends StatefulWidget {
  const DevicesComponent({final Key? key}) : super(key: key);

  @override
  State<DevicesComponent> createState() => _DevicesComponentState();
}

class _DevicesComponentState extends State<DevicesComponent> {
  final _controllerDevicesState = StreamController<DevicesStateUi>();
  late final StreamSubscription _subBloc;
  late final IotDevicesBloc _iotDevicesBloc;

  @override
  void initState() {
    _iotDevicesBloc = context.read<IotDevicesBloc>();
    _subBloc = _iotDevicesBloc.stream.listen(
      (final state) => state.when(
        initial: () => _controllerDevicesState.add(DevicesStateUiLoading()),
        loading: () => _controllerDevicesState.add(DevicesStateUiLoading()),
        update: (final iotDevicesDataWrapper) => _controllerDevicesState.add(
          DevicesStateUiSuccess(
            iotDevicesDataWrapper: iotDevicesDataWrapper,
          ),
        ),
        errorConnection: () => _controllerDevicesState.add(
          DevicesStateUiLoading(),
        ),
      ),
    );
    _iotDevicesBloc.add(const IotDevicesEvent.start());
    super.initState();
  }

  @override
  void dispose() {
    _subBloc.cancel();
    super.dispose();
  }

  void _onPowerChanged(final int id, final bool state) {
    final controlData = ControlData(
      iotIdControl: id,
      typeControl: state ? TypeControl.powerOn : TypeControl.powerOff,
    );
    _iotDevicesBloc.add(IotDevicesEvent.controlDevice(controlData));
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder(
        stream: _controllerDevicesState.stream,
        initialData: DevicesStateUiLoading(),
        builder: (final ctx, final snap) => switch (snap.data!) {
          DevicesStateUiLoading() => const LoadingStatus(
              text: 'Загружаем список устройств...',
            ),
          DevicesStateUiSuccess() => DevicesBuilder(
              iotDevices: (snap.data! as DevicesStateUiSuccess)
                  .iotDevicesDataWrapper
                  .devices,
              iotPowerChanged: _onPowerChanged,
            ),
        },
      );
}
