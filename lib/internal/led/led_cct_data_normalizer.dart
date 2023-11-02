import 'package:iot_models/iot_models.dart';

extension LedCctDataNormalizer on LedCctData {
  double getBrightnessNullOne() => brightness / 255;

  double getColorTemperatureNullOne() => colorTemperature / 255;
}
