import 'package:flutter/material.dart';
import 'package:home_monitor/internal/type_callbacks.dart';
import 'package:home_monitor/presentation/widgets/device_decorator.dart';
import 'package:iot_models/iot_models.dart';

class DevicesGrid extends StatelessWidget {
  const DevicesGrid({
    required this.iotDevices,
    required this.crossAxisCount,
    required this.iotPowerChanged,
    required this.deviceSelected,
    final Key? key,
  }) : super(key: key);

  final List<IotDevice> iotDevices;
  final int crossAxisCount;
  final IotPowerChanged iotPowerChanged;
  final ValueChanged<IotDevice> deviceSelected;


  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 16),
        child: GridView.builder(
          itemCount: iotDevices.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
          ),
          itemBuilder: (final ctx, final i) => DeviceDecorator(
            iotDevice: iotDevices[i],
            onSwitchChanged: (final state) => iotPowerChanged(
              iotDevices[i].id,
              state,
            ),
            onTap: () => deviceSelected(iotDevices[i]),
          ),
        ),
      );
}
