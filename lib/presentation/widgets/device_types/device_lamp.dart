import 'package:flutter/material.dart';
import 'package:home_monitor/internal/switch_property.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceLamp extends StatefulWidget {
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
  State<DeviceLamp> createState() => _DeviceLampState();
}

class _DeviceLampState extends State<DeviceLamp> implements SwitchProperty {
  @override
  Widget build(final BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
            child: Text(
              widget.headline,
              maxLines: 1,
            ),
          ),
          Assets.svg.lamp.svg(width: 46),
          Switch(
            value: localSwitchState,
            onChanged: onSwitchChanged,
          ),
        ],
      );

  @override
  bool localSwitchState = false;

  @override
  void initSwitchState() {
    localSwitchState = widget.lampData.controlPower == TypeControl.powerOn;
  }

  @override
  void onSwitchChanged(final bool newState) {
    localSwitchState = newState;
    setState(() {});
    widget.onSwitchChanged(newState);
  }
}
