import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/widgets/device_decorator.dart';
import 'package:iot_models/iot_models.dart';


class DevicesHorizontal extends StatelessWidget {
  const DevicesHorizontal({
    required this.iotDevices,
    required this.itemSize,
    required this.headline,
    final Key? key,
  }) : super(key: key);

  final List<IotDevice> iotDevices;
  final String headline;
  final double itemSize;

  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          headline,
        ),
        SizedBox(
          height: itemSize,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: iotDevices.length,
            itemExtent: 130,
            itemBuilder: (final ctx, final i) => DeviceDecorator(
              iotDevice: iotDevices[i],
            ),
          ),
        ),
      ],
    );
  }
}
