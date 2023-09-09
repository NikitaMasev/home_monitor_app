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
  Widget build(final BuildContext context) => Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, top: 4),
            child: Text(
              headline,
              maxLines: 1,
            ),
          ),
          Assets.svg.battery.svg(width: 46),
          Padding(
            padding: const EdgeInsets.only(left: 8, right: 8, bottom: 4),
            child: Text(
              'DC:${upsData.tempUps.toInt()}C Bat:${upsData.tempAcc.toInt()}C\n'
              'PWR:${(upsData.currentDC / 1000).toStringAsPrecision(2)}A ${upsData.voltageDC.toStringAsPrecision(2)}V',
            ),
          ),
        ],
      );
}
