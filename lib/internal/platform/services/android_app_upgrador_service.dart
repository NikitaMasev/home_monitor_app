import 'dart:io';

import 'package:home_monitor/internal/platform/services/app_upgrador_service.dart';
import 'package:install_plugin/install_plugin.dart';
import 'package:path_provider/path_provider.dart';

final class AndroidAppUpgradorService implements AppUpgradorService {
  @override
  Future<void> upgrade(final List<int> bytes) async {
    //const fullPath = '/storage/emulated/0/Download/app_upgrade.apk';
    final dir = await getTemporaryDirectory();
    final fullPath = '${dir.path}/app_upgrade.apk';
    final fileApp = File(fullPath);
    final raf = await fileApp.open(mode: FileMode.write);
    await raf.writeFrom(bytes);
    await InstallPlugin.installApk(fullPath);
  }
}
