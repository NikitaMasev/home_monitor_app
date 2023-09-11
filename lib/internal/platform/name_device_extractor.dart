import 'dart:io' show Platform;
import 'dart:math';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class NameDeviceExtractor {
  Future<String> getName() async {
    final deviceInfoPlugin = DeviceInfoPlugin();
    var name = 'Unknown device ${Random().nextInt(5000)}';

    if (kIsWeb) {
      final info = await deviceInfoPlugin.webBrowserInfo;
      name = info.vendor ?? name;
    } else if (Platform.isAndroid) {
      final info = await deviceInfoPlugin.androidInfo;
      name = info.device;
    } else if (Platform.isWindows) {
      final info = await deviceInfoPlugin.windowsInfo;
      name = info.computerName;
    }
    return name;
  }
}
