import 'package:home_monitor/data/sources/shared_platform_persistent_impl.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSourcesConfigurator {
  DataSourcesConfigurator(
    this._env,
  );

  final Env _env;

  Future<SharedPersistent> sharedPersistent() async =>
      SharedPlatformPersistentImpl(
        shared: await SharedPreferences.getInstance(),
      );

  String get ipLocal => const String.fromEnvironment('IP_LOCAL');
  String get portLocal => const String.fromEnvironment('PORT');
  String get ipRemote => const String.fromEnvironment('IP_REMOTE');
  String get portRemote => const String.fromEnvironment('PORT');
}
