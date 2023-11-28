import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:home_monitor/internal/platform/build_version.dart';

final class BuildAbiExtractor {
  const BuildAbiExtractor();

  Future<(String, String)> getBuildAbi() async {
    var build = '';
    var abi = '';

    if (Platform.isAndroid) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final info = await deviceInfoPlugin.androidInfo;

      build = packageVersion.split('+').last;
      abi = info.supportedAbis.first;
    }
    return (build, abi);
  }
}
