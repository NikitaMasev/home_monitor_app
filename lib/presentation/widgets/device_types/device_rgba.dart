import 'package:flutter/material.dart';
import 'package:home_monitor/internal/switch_property.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceRgba extends StatefulWidget {
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
  State<DeviceRgba> createState() => _DeviceRgbaState();
}

class _DeviceRgbaState extends State<DeviceRgba> implements SwitchProperty {
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
          Assets.svg.brightness.svg(width: 46),
          Switch(
            value: localSwitchState,
            onChanged: onSwitchChanged,
          ),
        ],
      );

  @override
  void initState() {
    initSwitchState();
    super.initState();
  }

  @override
  bool localSwitchState = false;

  @override
  void initSwitchState() {
    localSwitchState = widget.ledData.powerOn;
  }

  @override
  void onSwitchChanged(final bool newState) {
    localSwitchState = newState;
    setState(() {});
    widget.onSwitchChanged(newState);
  }
}
