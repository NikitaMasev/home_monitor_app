import 'package:home_monitor/internal/platform/services/android_app_upgrador_service.dart';
import 'package:home_monitor/internal/platform/services/app_upgrador_service.dart';

final class ServicesConfigurator {
  const ServicesConfigurator();

  ///TODO check platform
  Future<AppUpgradorService> appUpgradorService() async =>
      AndroidAppUpgradorService();
}
