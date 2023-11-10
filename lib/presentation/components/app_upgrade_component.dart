import 'dart:io' show Platform;

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/material.dart';
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
    Permission.requestInstallPackages
        .request()
        .then((final permissionStatus) async {
      if (permissionStatus.isGranted) {
        if (Platform.isAndroid) {
          final deviceInfoPlugin = DeviceInfoPlugin();
          final info = await deviceInfoPlugin.androidInfo;
          final packageInfo = await PackageInfo.fromPlatform();

          await RUpgrade.upgrade(
            header: {
              'appversion': packageInfo.version,
              'buildversion': packageInfo.buildNumber,
              'abi': info.supportedAbis.first,
            },
            useDownloadManager: true,
            'http://192.168.50.143:80',
            fileName: 'home_monitor_app.apk',
          );
          RUpgrade.stream.listen((final event) {
            print(event.percent);
          });
        }
      }
    });
    super.initState();
  }


  @override
  Widget build(final BuildContext context) => widget.child;
}
