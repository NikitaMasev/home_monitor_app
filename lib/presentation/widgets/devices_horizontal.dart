import 'package:flutter/material.dart';
import 'package:home_monitor/internal/type_callbacks.dart';
import 'package:home_monitor/presentation/widgets/device_decorator.dart';
import 'package:iot_models/iot_models.dart';

class DevicesHorizontal extends StatelessWidget {
  const DevicesHorizontal({
    required this.iotDevices,
    required this.itemSize,
    required this.headline,
    required this.iotPowerChanged,
    required this.deviceSelected,
    final Key? key,
  }) : super(key: key);

  final List<IotDevice> iotDevices;
  final String headline;
  final double itemSize;
  final IotPowerChanged iotPowerChanged;
  final ValueChanged<IotDevice> deviceSelected;

  @override
  Widget build(final BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            headline,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: SizedBox(
              height: itemSize,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: iotDevices.length,
                itemExtent: itemSize,
                itemBuilder: (final ctx, final i) => DeviceDecorator(
                  iotDevice: iotDevices[i],
                  onSwitchChanged: (final state) => iotPowerChanged(
                    iotDevices[i].id,
                    state,
                  ),
                  onTap: () => deviceSelected(iotDevices[i]),
                ),
              ),
            ),
          ),
        ],
      );
}
