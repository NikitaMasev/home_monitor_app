import 'dart:io';

import 'package:home_monitor/internal/platform/services/app_upgrador_service.dart';
import 'package:path_provider/path_provider.dart';
import 'package:r_upgrade/r_upgrade.dart';

final class AndroidAppUpgradorService implements AppUpgradorService {
  @override
  Future<void> upgrade(final List<int> bytes) async {
    final dir = await getTemporaryDirectory();
    final fullPath = '$dir/app_upgrade.apk';
    final fileApp = File(fullPath);
    await fileApp.writeAsBytes(bytes);
    await RUpgrade.installByPath(fullPath);
  }
}
