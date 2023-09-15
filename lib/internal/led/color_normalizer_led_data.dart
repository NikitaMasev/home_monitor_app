import 'package:flutter/material.dart';
import 'package:iot_models/iot_models.dart';

extension ColorNormalizerLedData on LedData {
  LedData copyWithColor(final Color color) {
    final hsv = HSVColor.fromColor(color);
    return LedData(
      h: ((hsv.hue / 360) * 255).toInt(),
      s: ((hsv.saturation / 1.0) * 255).toInt(),
      v: ((hsv.value / 1.0) * 255).toInt(),
      mode: mode,
      powerOn: powerOn,
    );
  }
}
