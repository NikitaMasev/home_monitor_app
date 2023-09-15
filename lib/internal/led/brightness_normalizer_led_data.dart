import 'package:iot_models/iot_models.dart';

extension BrightnessNormalizerLedData on LedData {
  LedData copyWithBrightness(final double brightness) {
    final val = (brightness * 255).toInt();
    return LedData(h: h,
      s: s,
      v: val,
      mode: mode,
      powerOn: powerOn,);
  }
}
