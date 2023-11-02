import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/components/led_cct_component.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LedCctDetailPage extends StatelessWidget {
  const LedCctDetailPage({
    required this.iotDevicesBloc,
    required this.ledCctData,
    required this.idDevice,
  });

  final IotDevicesBloc iotDevicesBloc;
  final LedCctData ledCctData;
  final int idDevice;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Настройки лампы'),
        ),
        body: Provider.value(
          value: iotDevicesBloc,
          child: LedCctComponent(
            ledCctData: ledCctData,
            idDevice: idDevice,
          ),
        ),
      );
}
