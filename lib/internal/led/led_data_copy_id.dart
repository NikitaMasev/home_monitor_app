import 'package:iot_models/iot_models.dart';

extension LedDataCopyId on LedData {
  LedData copyWithId(final int idEffect) => LedData(
        h: h,
        s: s,
        v: v,
        mode: idEffect,
        powerOn: powerOn,
      );
}
