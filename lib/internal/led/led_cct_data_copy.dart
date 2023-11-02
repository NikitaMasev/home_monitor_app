import 'package:iot_models/iot_models.dart';

extension LedCctDataCopy on LedCctData {
  LedCctData copyWithBrightness(final double val) => LedCctData(
      brightness: (val*255).toInt(),
      colorTemperature: colorTemperature,
      powerOn: powerOn,
    );

  LedCctData copyWithColorTemperature(final double val) => LedCctData(
    brightness: brightness,
    colorTemperature: (val*255).toInt(),
    powerOn: powerOn,
  );
}
