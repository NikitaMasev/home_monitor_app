import 'package:home_monitor/di/models/data_sources.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:iot_client_starter/iot_client_starter.dart';

class RepositoriesCreator {
  RepositoriesCreator(
    this._sources,
    this._env,
  );

  final DataSources _sources;
  final Env _env;

  Future<UserRepository> userRepository() => configUserRepo();
}
