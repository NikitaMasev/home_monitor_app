import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/devices_grid.dart';
import 'package:home_monitor/presentation/widgets/devices_horizontal.dart';
import 'package:iot_models/iot_models.dart';

const _sizeDeviceItem = 130.0;
const _paddingVerticalDevicesHorizontal = 32.0;
const _paddingHorizontalDevicesHorizontal = 8.0;
const _paddingHorizontalDevicesGrid = 8.0;

class DevicesBuilder extends StatelessWidget {
  const DevicesBuilder({
    required this.iotDevices,
    final Key? key,
  }) : super(key: key);

  final List<IotDevice> iotDevices;

  int _getGridCount(final BuildContext context) {
    final mediaData = MediaQuery.of(context);
    final width = mediaData.size.width;
    final crossCount = (width - 2 * _paddingHorizontalDevicesGrid) ~/ _sizeDeviceItem;
    log('new cross count ${crossCount}');
    return crossCount;
  }

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
      padding: const EdgeInsets.symmetric(
        vertical: _paddingVerticalDevicesHorizontal,
        horizontal: _paddingHorizontalDevicesHorizontal,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DevicesHorizontal(
            iotDevices: devicesControl,
            headline: 'Devices for control',
            itemSize: _sizeDeviceItem,
          ),
          DevicesHorizontal(
            iotDevices: devicesMonitor,
            headline: 'Devices for monitor',
            itemSize: _sizeDeviceItem,
          ),
        ],
      ),
    )
        : devicesControl.isNotEmpty
        ? Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: _paddingHorizontalDevicesGrid),
      child: DevicesGrid(
        iotDevices: devicesControl,
        crossAxisCount: _getGridCount(context),
      ),
    )
        : Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: _paddingHorizontalDevicesGrid),
      child: DevicesGrid(
        iotDevices: devicesMonitor,
        crossAxisCount: _getGridCount(context),
      ),
    );
  }
}
