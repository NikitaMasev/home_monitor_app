import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceControl extends StatelessWidget {
  const DeviceControl({
    required this.iotDevice,
    final Key? key,
  }) : super(key: key);

  final IotDevice iotDevice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 130,
      height: 130,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 4),
              child: Text(iotDevice.name ?? 'NONAME', maxLines: 1,),
            ),
            Assets.svg.lamp.svg(width: 46),
            Switch(
              value: false,
              onChanged: (final val) {},
            ),
          ],
        ),
        color: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
      ),
    );
  }
}
