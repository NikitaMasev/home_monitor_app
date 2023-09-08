import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/device_control.dart';
import 'package:home_monitor/presentation/widgets/device_monitor.dart';
import 'package:iot_models/iot_models.dart';

class DeviceDecorator extends StatelessWidget {
  const DeviceDecorator({
    required this.iotDevice,
    final Key? key,
  }) : super(key: key);

  final IotDevice iotDevice;

  @override
  Widget build(final BuildContext context) => switch (iotDevice.typeDevice) {
        TypeDevice.ups => DeviceMonitor(iotDevice: iotDevice,),
        TypeDevice.lamp => DeviceControl(iotDevice: iotDevice,),
        TypeDevice.rgba => DeviceControl(iotDevice: iotDevice,),
        TypeDevice.rgbaAddress => DeviceControl(iotDevice: iotDevice,),
        TypeDevice.tempSensor => DeviceMonitor(iotDevice: iotDevice,),
        TypeDevice.unknown => Container(),
      };
}
