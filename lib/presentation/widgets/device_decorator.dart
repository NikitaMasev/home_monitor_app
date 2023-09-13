import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_lamp.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_rgba.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_rgba_address.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_sensor.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_ups.dart';
import 'package:iot_models/iot_models.dart';

class DeviceDecorator extends StatelessWidget {
  const DeviceDecorator({
    required this.iotDevice,
    required this.onSwitchChanged,
    required this.onTap,
    final Key? key,
  }) : super(key: key);

  final IotDevice iotDevice;
  final ValueChanged<bool> onSwitchChanged;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    final nameDevices = iotDevice.name ??
        '${typeDeviceToString[iotDevice.typeDevice]!} ${iotDevice.id}';
    return Card(
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      child: switch (iotDevice.typeDevice) {
        TypeDevice.ups => DeviceUps(
            headline: iotDevice.name ?? nameDevices,
            upsData: iotDevice.data as UpsData,
          ),
        TypeDevice.lamp => DeviceLamp(
            headline: iotDevice.name ?? nameDevices,
            lampData: iotDevice.data as LampData,
            onSwitchChanged: onSwitchChanged,
          ),
        TypeDevice.rgba => InkWell(
            splashColor: Theme.of(context).colorScheme.tertiaryContainer,
            onTap: onTap,
            child: DeviceRgba(
              headline: iotDevice.name ?? nameDevices,
              ledData: iotDevice.data as LedData,
              onSwitchChanged: onSwitchChanged,
            ),
          ),
        TypeDevice.rgbaAddress => InkWell(
            splashColor: Theme.of(context).colorScheme.tertiaryContainer,
            onTap: onTap,
            child: DeviceRgbaAddress(
              headline: iotDevice.name ?? nameDevices,
              ledData: iotDevice.data as LedData,
              onSwitchChanged: onSwitchChanged,
            ),
          ),
        TypeDevice.tempSensor => DeviceSensor(
            headline: iotDevice.name ?? nameDevices,
          ),
        TypeDevice.unknown => const SizedBox.shrink(),
      },
    );
  }
}
