import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceRgba extends StatelessWidget {
  const DeviceRgba({
    required this.headline,
    required this.ledData,
    required this.onSwitchChanged,
    final Key? key,
  }) : super(key: key);

  final String headline;
  final LedData ledData;
  final ValueChanged<bool> onSwitchChanged;

  @override
  Widget build(final BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
            child: Text(
              headline,
              maxLines: 1,
            ),
          ),
          Assets.svg.brightness.svg(width: 46),
          Switch(
            value: ledData.powerOn,
            onChanged: onSwitchChanged,
          ),
        ],
      );
}
