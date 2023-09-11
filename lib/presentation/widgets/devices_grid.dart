import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/device_decorator.dart';
import 'package:iot_models/iot_models.dart';

class DevicesGrid extends StatelessWidget {
  const DevicesGrid({
    required this.iotDevices,
    required this.crossAxisCount,
    final Key? key,
  }) : super(key: key);

  final List<IotDevice> iotDevices;
  final int crossAxisCount;

  @override
  Widget build(final BuildContext context) {
    return GridView.builder(
      itemCount: iotDevices.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
      ),
      itemBuilder: (final ctx, final i) => DeviceDecorator(
        iotDevice: iotDevices[i],
      ),
    );
  }
}
