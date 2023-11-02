import 'package:flutter/material.dart';
import 'package:home_monitor/internal/ui_extended/switch_property.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceLedCct extends StatefulWidget {
  const DeviceLedCct({
    required this.headline,
    required this.ledCctData,
    required this.onSwitchChanged,
    final Key? key,
  }) : super(key: key);

  final String headline;
  final LedCctData ledCctData;
  final ValueChanged<bool> onSwitchChanged;

  @override
  State<DeviceLedCct> createState() => _DeviceLedCctState();
}

class _DeviceLedCctState extends State<DeviceLedCct> implements SwitchProperty {
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
        Assets.svg.chandelier.svg(
          width: 66,
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
  void initState() {
    initSwitchState();
    super.initState();
  }

  @override
  bool localSwitchState = false;

  @override
  void initSwitchState() {
    localSwitchState = widget.ledCctData.powerOn;
  }

  @override
  void onSwitchChanged(final bool newState) {
    localSwitchState = newState;
    setState(() {});
    widget.onSwitchChanged(newState);
  }
}
