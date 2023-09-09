import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';

class DeviceSensor extends StatelessWidget {
  const DeviceSensor({
    required this.headline,
    final Key? key,
  }) : super(key: key);

  final String headline;

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
      Assets.svg.thermometer.svg(width: 46),
      Padding(
        padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
        child: Text(
          'T:28C\n'
              'H:38%',
        ),
      ),
    ],
  );
}
