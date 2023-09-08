import 'package:flutter/material.dart';
import 'package:iot_models/iot_models.dart';

class DeviceControl extends StatelessWidget {
  const DeviceControl({
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
            Icons.access_time,
            size: 48,
          ),
          Switch(
            value: false,
            onChanged: (final val) {},
          ),
        ],
      ),
      color: Theme.of(context).colorScheme.surfaceVariant,
      elevation: 0,
    );
  }
}
