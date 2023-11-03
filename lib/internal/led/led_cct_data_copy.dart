import 'package:iot_models/iot_models.dart';

extension LedCctDataCopy on LedCctData {
  LedCctData copyWithBrightness(final double val) => LedCctData(
      brightness: (val*255).toInt(),
      colorTemperature: colorTemperature,
      powerOn: powerOn,
    );

  LedCctData copyWithColorTemperature(final double val) {
    var newColorTemp = 0;

    if (val>=0.45 && val <=0.55) {
      newColorTemp = 128;
    } else {
      newColorTemp = (val*255).toInt();
    }
    return LedCctData(
    brightness: brightness,
    colorTemperature: newColorTemp,
    powerOn: powerOn,
  );
  }
}
