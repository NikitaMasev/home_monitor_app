import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/components/led_address_component.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';
import 'package:provider/provider.dart';

@RoutePage()
class LedAddressDetailPage extends StatelessWidget {
  const LedAddressDetailPage({
    required this.iotDevicesBloc,
    required this.ledData,
    required this.idDevice,
  });

  final IotDevicesBloc iotDevicesBloc;
  final LedData ledData;
  final int idDevice;

  @override
  Widget build(final BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Настройки адресной ленты'),
        ),
        body: Provider.value(
          value: iotDevicesBloc,
          child: LedAddressComponent(
            ledData: ledData,
            idDevice: idDevice,
          ),
        ),
      );
}
