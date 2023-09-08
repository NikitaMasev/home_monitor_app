import 'package:flutter/material.dart';
import 'package:iot_models/iot_models.dart';


class DeviceMonitor extends StatelessWidget {
  const DeviceMonitor({
    required this.iotDevice,
    final Key? key,
  }) : super(key: key);

  final IotDevice iotDevice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 16, right: 16),
            child: Text(iotDevice.name ?? 'NONAME', maxLines: 1,),
          ),
          Icon(
            Icons.battery_4_bar_sharp,
            size: 48,
          ),
          Text('DC:37C Bat:30C Cap:84%'),
        ],
      ),
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
    );
  }
}
