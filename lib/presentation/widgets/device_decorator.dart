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
    final Key? key,
  }) : super(key: key);

  final IotDevice iotDevice;

  @override
  Widget build(final BuildContext context) => Card(
        margin: EdgeInsets.zero,
        color: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
        child: switch (iotDevice.typeDevice) {
          TypeDevice.ups => DeviceUps(
              headline: iotDevice.name!,
              upsData: iotDevice.data as UpsData,
            ),
          TypeDevice.lamp => DeviceLamp(
              headline: iotDevice.name!,
              lampData: iotDevice.data as LampData,
              onSwitchChanged: (final val) {},
            ),
          TypeDevice.rgba => DeviceRgba(
              headline: iotDevice.name!,
              ledData: iotDevice.data as LedData,
              onSwitchChanged: (final val) {},
            ),
          TypeDevice.rgbaAddress => DeviceRgbaAddress(
              headline: iotDevice.name!,
              ledData: iotDevice.data as LedData,
              onSwitchChanged: (final val) {},
            ),
          TypeDevice.tempSensor => DeviceSensor(
              headline: iotDevice.name!,
            ),
          TypeDevice.unknown => const SizedBox.shrink(),
        },
      );
}
