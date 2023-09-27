import 'package:flutter/material.dart';
import 'package:home_monitor/internal/ui_extended/switch_property.dart';
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
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.headline,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            Assets.svg.lamp.svg(
              width: 56,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
            Switch(
              value: localSwitchState,
              onChanged: onSwitchChanged,
            ),
          ],
        ),
      );

  @override
  bool localSwitchState = false;

  @override
  void initState() {
    initSwitchState();
    super.initState();
  }

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
