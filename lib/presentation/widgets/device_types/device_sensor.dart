import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';

class DeviceSensor extends StatelessWidget {
  const DeviceSensor({
    required this.headline,
    final Key? key,
  }) : super(key: key);

  final String headline;

  @override
  Widget build(final BuildContext context) => Padding(
        padding: const EdgeInsets.all(8),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              headline,
              maxLines: 2,
              textAlign: TextAlign.center,
            ),
            Assets.svg.thermometer.svg(
              width: 56,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('T: 28.3 C'),
                Text('H: 43.7 %'),
              ],
            ),
          ],
        ),
      );
}
