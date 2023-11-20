import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:r_upgrade/r_upgrade.dart';

class AppUpgradeComponent extends StatefulWidget {
  const AppUpgradeComponent({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  State<AppUpgradeComponent> createState() => _AppUpgradeComponentState();
}

class _AppUpgradeComponentState extends State<AppUpgradeComponent> {
  @override
  void initState() {
    _updateFlow();
    super.initState();
  }

  Future<void> _updateFlow() async {
    await Future.delayed(Duration(seconds: 5));
    await Permission.requestInstallPackages
        .request()
        .then((final permissionStatus) async {
      if (permissionStatus.isGranted) {
        if (Platform.isAndroid) {
          final deviceInfoPlugin = DeviceInfoPlugin();
          final info = await deviceInfoPlugin.androidInfo;
          final packageInfo = await PackageInfo.fromPlatform();

          final crypto =
              CryptoImpl(key: '0', iv: '0');

          final valueBuildEncr = crypto.encrypt(packageInfo.buildNumber);
          final valueAbiEncr = crypto.encrypt(info.supportedAbis.first);

          print(valueBuildEncr);
          print(valueAbiEncr);

          final dio = Dio(
            BaseOptions(
              headers: {
                'buildversion': valueBuildEncr,
              },
            ),
          );

          final needUpgrade = await dio.get(
            'http://192.168.50.143:4500/needUpgrade',
          );
          print(needUpgrade);

          if (bool.parse(needUpgrade.data.toString())) {
            await RUpgrade.upgrade(
              header: {
                'abi': valueAbiEncr,
              },
              useDownloadManager: true,
              'http://192.168.50.143:4500/upgrade',
              fileName: 'home_monitor_app${int.parse(packageInfo.buildNumber)+1}.apk',
            );
            RUpgrade.stream.listen((final event) {
              print(event.percent);
            });
          }
        }
      }
    });
  }

  @override
  Widget build(final BuildContext context) => widget.child;
}
