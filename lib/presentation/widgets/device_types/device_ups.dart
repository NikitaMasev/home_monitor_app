import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';
import 'package:iot_models/iot_models.dart';

class DeviceUps extends StatelessWidget {
  const DeviceUps({
    required this.headline,
    required this.upsData,
    final Key? key,
  }) : super(key: key);

  final String headline;
  final UpsData upsData;

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
            Assets.svg.battery.svg(
              width: 56,
              colorFilter: ColorFilter.mode(
                Theme.of(context).colorScheme.tertiary,
                BlendMode.srcIn,
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('DC: ${upsData.tempUps.toInt()} C'),
                    Text('Bat: ${upsData.tempAcc.toStringAsPrecision(3)} C'),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('PWR: ${(upsData.currentDC / 1000).toStringAsPrecision(2)} A'),
                    Text('${upsData.voltageDC.toStringAsPrecision(3)} V'),
                  ],
                ),
              ],
            ),
          ],
        ),
      );
}
