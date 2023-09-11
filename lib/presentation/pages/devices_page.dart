import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/devices_builder.dart';
import 'package:iot_models/iot_models.dart';

@RoutePage()
class DevicesPage extends StatelessWidget {
  const DevicesPage();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: DevicesBuilder(
        iotDevices: [],
      ),
    );
  }
}
