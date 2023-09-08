import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/device_decorator.dart';
import 'package:iot_models/iot_models.dart';

class DevicesBuilder extends StatelessWidget {
  const DevicesBuilder({
    required this.iotDevices,
    final Key? key,
  }) : super(key: key);

  final List<IotDevice> iotDevices;

  @override
  Widget build(final BuildContext context) {
    final devicesControl = iotDevices
        .where(
          (final device) =>
              device.typeDevice == TypeDevice.lamp ||
              device.typeDevice == TypeDevice.rgbaAddress ||
              device.typeDevice == TypeDevice.rgba,
        )
        .toList();

    final devicesMonitor = iotDevices
        .where(
          (final device) =>
              device.typeDevice == TypeDevice.ups ||
              device.typeDevice == TypeDevice.tempSensor,
        )
        .toList();
    return devicesControl.isNotEmpty && devicesMonitor.isNotEmpty
        ? Padding(
            padding: EdgeInsets.symmetric(vertical: 32, horizontal: 8),
            child: Column(
              children: [
                Text(
                  'Devices for control',
                ),
                SizedBox(
                  height: 130,
                  child: ListView.builder(
                    physics: ScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: devicesControl.length,
                    itemBuilder: (final ctx, final i) =>
                        DeviceDecorator(iotDevice: devicesControl[i]),
                  ),
                ),
                Text(
                  'Devices for monitor',
                ),
                SizedBox(
                  height: 105,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    itemCount: devicesMonitor.length,
                    itemBuilder: (final ctx, final i) =>
                        DeviceDecorator(iotDevice: devicesMonitor[i]),
                  ),
                ),
              ],
            ),
          )
        : devicesControl.isNotEmpty
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  itemCount: devicesControl.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (final ctx, final i) => DeviceDecorator(
                    iotDevice: devicesControl[i],
                  ),
                ),
              )
            : Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: GridView.builder(
                  itemCount: devicesMonitor.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1.95),
                  itemBuilder: (final ctx, final i) => DeviceDecorator(
                    iotDevice: devicesMonitor[i],
                  ),
                ),
              );
  }
}