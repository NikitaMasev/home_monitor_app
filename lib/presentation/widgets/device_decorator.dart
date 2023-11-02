import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_lamp.dart';
import 'package:home_monitor/presentation/widgets/device_types/device_led_cct.dart';
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
  Widget build(final BuildContext context) => Card(
        child: switch (iotDevice.typeDevice) {
          TypeDevice.ups => DeviceUps(
              headline: iotDevice.name,
              upsData: iotDevice.data as UpsData,
              key: ValueKey(iotDevice.hashCode),
            ),
          TypeDevice.lamp => DeviceLamp(
              headline: iotDevice.name,
              lampData: iotDevice.data as LampData,
              onSwitchChanged: onSwitchChanged,
              key: ValueKey(iotDevice.hashCode),
            ),
          TypeDevice.rgba => InkWell(
              onTap: onTap,
              child: DeviceRgba(
                headline: iotDevice.name,
                ledData: iotDevice.data as LedData,
                onSwitchChanged: onSwitchChanged,
                key: ValueKey(iotDevice.hashCode),
              ),
            ),
          TypeDevice.rgbaAddress => InkWell(
              onTap: onTap,
              child: DeviceRgbaAddress(
                headline: iotDevice.name,
                ledData: iotDevice.data as LedData,
                onSwitchChanged: onSwitchChanged,
                key: ValueKey(iotDevice.hashCode),

                ///TODO analyze performance hashCode
                //key: ValueKey((iotDevice.data as LedData).hashCode ^ iotDevice.name.hashCode),
                //key: ValueKey('${iotDevice.name}${(iotDevice.data as LedData).powerOn}'),
                //key: ValueKey((iotDevice.data as LedData).powerOn),
                //key: key,
                //key: ValueKey(iotDevice.hashCode),
              ),
            ),
          TypeDevice.ledCct => InkWell(
            onTap: onTap,
            child: DeviceLedCct(
              headline: iotDevice.name,
              ledCctData: iotDevice.data as LedCctData,
              onSwitchChanged: onSwitchChanged,
              key: ValueKey(iotDevice.hashCode),
            ),
          ),
          TypeDevice.tempSensor => DeviceSensor(
              headline: iotDevice.name,
              key: ValueKey(iotDevice.hashCode),
            ),
          TypeDevice.unknown => const SizedBox.shrink(),
        },
      );
}
