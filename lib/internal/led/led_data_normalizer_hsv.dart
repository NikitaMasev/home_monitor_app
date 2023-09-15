import 'package:iot_models/iot_models.dart';

extension LedDataNormalizerHsv on LedData {
  double getHue360() => (h / 255) * 360;

  double getSatNulOne() => (s / 255) * 1;

  double getValNulOne() => (v / 255) * 1;

  double getBrightnessNullOne() => (v / 255) * 1;
}
