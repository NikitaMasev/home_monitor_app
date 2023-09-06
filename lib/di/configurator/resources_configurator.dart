import 'package:home_monitor/di/configurator/data_sources_configurator.dart';
import 'package:home_monitor/di/configurator/repositories_creator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/models/resources.dart';

class ResourcesConfigurator {
  ResourcesConfigurator({
    required final Env env,
    required final bool logger,
  })  : _env = env,
        _logger = logger;

  final Env _env;
  final bool _logger;

  Future<Resources> getResources() async {
    final dataSources = await DataSourcesConfigurator(_env).getDataSources();
    final repositoriesCreator = RepositoriesCreator(dataSources, _env);

    return Resources(
      repositoriesCreator: repositoriesCreator,
      dataSources: dataSources,
      env: _env,
      logger: _logger,
    );
  }
}
