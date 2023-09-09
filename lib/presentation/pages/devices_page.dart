import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/devices_builder.dart';
import 'package:iot_models/iot_models.dart';

final  _devicesTest = <IotDevice>[
  IotDevice(id: 0, typeDevice: TypeDevice.lamp, name: 'LAMP Room 1', data: LampData(controlPower: TypeControl.powerOn)),
  IotDevice(id: 1, typeDevice: TypeDevice.rgba, name: 'RGBA Room 1', data: LedData(h: 120, s: 50, v: 180, mode: 120, powerOn: false)),
  IotDevice(id: 2, typeDevice: TypeDevice.rgbaAddress, name: 'RGBA Room 2' ,data: LedData(h: 120, s: 50, v: 180, mode: 120, powerOn: true)),
  IotDevice(id: 3, typeDevice: TypeDevice.tempSensor, name: 'Sensor Room 1'),
  IotDevice(id: 4, typeDevice: TypeDevice.ups, name: 'UPS for router 1', data: UpsData(tempUps: 23.354, tempAcc: 37.6565, pwmCooler: 0, currentDC: 1582.5, voltageDC: 12.35)),
  IotDevice(id: 5, typeDevice: TypeDevice.ups, name: 'UPS for router 2', data: UpsData(tempUps: 23.354, tempAcc: 37.6565, pwmCooler: 0, currentDC: 1582.5, voltageDC: 12.35)),
  IotDevice(id: 6, typeDevice: TypeDevice.lamp, name: 'LAMP Room 2', data: LampData(controlPower: TypeControl.powerOff)),
  //IotDevice(id: 6, typeDevice: TypeDevice.unknown),
];

const _devicesMonitorTest = <IotDevice>[
  IotDevice(id: 0, typeDevice: TypeDevice.ups, name: 'UPS for router 1'),
  IotDevice(id: 1, typeDevice: TypeDevice.tempSensor, name: 'Sensor Room 2'),
  IotDevice(id: 2, typeDevice: TypeDevice.ups, name: 'UPS for router 2'),
  IotDevice(id: 3, typeDevice: TypeDevice.tempSensor, name: 'Sensor Room 1'),
  IotDevice(id: 4, typeDevice: TypeDevice.tempSensor, name: 'Sensor Room 1'),
  IotDevice(id: 5, typeDevice: TypeDevice.tempSensor, name: 'Sensor Room 4'),
  //IotDevice(id: 6, typeDevice: TypeDevice.unknown),
];

const _devicesControlTest = <IotDevice>[
  IotDevice(id: 0, typeDevice: TypeDevice.lamp, name: 'LAMP Room 1'),
  IotDevice(id: 1, typeDevice: TypeDevice.lamp, name: 'LAMP Room 2'),
  IotDevice(id: 2, typeDevice: TypeDevice.rgbaAddress, name: 'RGBA Room 2'),
  IotDevice(id: 3, typeDevice: TypeDevice.rgbaAddress, name: 'RGBA Room 1'),
  IotDevice(id: 4, typeDevice: TypeDevice.rgba, name: 'RGBA Room 2'),
  IotDevice(id: 5, typeDevice: TypeDevice.rgba, name: 'RGBA Room 3'),
  //IotDevice(id: 6, typeDevice: TypeDevice.unknown),
];

@RoutePage()
class DevicesPage extends StatelessWidget {
  const DevicesPage();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: DevicesBuilder(
        iotDevices: _devicesTest,
      ),
    );
  }
}
