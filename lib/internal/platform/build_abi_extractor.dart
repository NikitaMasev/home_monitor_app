import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class BuildAbiExtractor {
  const BuildAbiExtractor();

  Future<(String, String, String)> getBuildAbi() async {
    var buildFromLib = '';
    var build = '';
    var abi = '';

    if (Platform.isAndroid) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final info = await deviceInfoPlugin.androidInfo;
      final packageInfo = await PackageInfo.fromPlatform();

      buildFromLib = packageInfo.buildNumber;
      build = 3.toString();
      abi = info.supportedAbis.first;
    }
    return (build, abi, buildFromLib);
  }
}
