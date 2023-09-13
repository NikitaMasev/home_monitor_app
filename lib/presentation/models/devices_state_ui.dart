import 'package:iot_models/iot_models.dart';

sealed class DevicesStateUi {}

class DevicesStateUiLoading implements DevicesStateUi {}

class DevicesStateUiSuccess implements DevicesStateUi {
  DevicesStateUiSuccess({required this.iotDevicesDataWrapper});

  final IotDevicesDataWrapper iotDevicesDataWrapper;
}
