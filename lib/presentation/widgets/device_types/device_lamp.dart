import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceLamp extends StatelessWidget {
  const DeviceLamp({
    required this.headline,
    required this.lampData,
    required this.onSwitchChanged,
    final Key? key,
  }) : super(key: key);

  final String headline;
  final LampData lampData;
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
          Assets.svg.lamp.svg(width: 46),
          Switch(
            value: lampData.controlPower == TypeControl.powerOn,
            onChanged: onSwitchChanged,
          ),
        ],
      );
}
