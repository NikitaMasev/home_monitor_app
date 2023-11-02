import 'package:flutter/material.dart';
import 'package:iot_models/iot_models.dart';

extension LedDataCopy on LedData {
  LedData copyWithId(final int idEffect) => LedData(
        h: h,
        s: s,
        v: v,
        mode: idEffect,
        powerOn: powerOn,
      );

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

  LedData copyWithBrightness(final double brightness) {
    final val = (brightness * 255).toInt();
    return LedData(h: h,
      s: s,
      v: val,
      mode: mode,
      powerOn: powerOn,);
  }
}
