import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:package_info_plus/package_info_plus.dart';

final class BuildAbiExtractor {
  const BuildAbiExtractor();

  Future<(String, String)> getBuildAbi() async {
    var build = '';
    var abi = '';

    if (Platform.isAndroid) {
      final deviceInfoPlugin = DeviceInfoPlugin();
      final info = await deviceInfoPlugin.androidInfo;
      final packageInfo = await PackageInfo.fromPlatform();

      build = 3.toString();
      abi = info.supportedAbis.first;
    }
    print('build $build abi $abi');
    return (build, abi);
  }
}
