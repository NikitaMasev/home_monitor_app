import 'package:home_monitor/di/configurator/crypto_configurator.dart';
import 'package:home_monitor/di/configurator/data_sources_configurator.dart';
import 'package:home_monitor/di/configurator/repositories_creator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/models/repositories.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:home_monitor/internal/platform/name_device_extractor.dart';

class ResourcesConfigurator {
  ResourcesConfigurator({
    required final Env env,
    required final bool logger,
  })  : _env = env,
        _logger = logger;

  final Env _env;
  final bool _logger;

  Future<Resources> getResources() async {
    final cryptoConfig = CryptoConfigurator(_env);
    final dataSourcesConfig = DataSourcesConfigurator(_env);
    final repositoriesCreator = RepositoriesCreator(
      env: _env,
      cryptoConfigurator: cryptoConfig,
      dataSourcesConfigurator: dataSourcesConfig,
    );
    final userRepo = await repositoriesCreator.userRepository();
    final (
      clientRepository,
      devicesRepository,
      iotStateRepository,
      pausable,
      resumable
    ) = await repositoriesCreator.iotDataRepository();

    final nameDevice = await NameDeviceExtractor().getName();

    return Resources(
      repositories: Repositories(
        userRepository: userRepo,
        clientRepository: clientRepository,
        devicesRepository: devicesRepository,
        iotStateRepository: iotStateRepository,
      ),
      env: _env,
      logger: _logger,
      nameDevice: nameDevice,
      pausableResources: [pausable],
      resumableResources: [resumable],
    );
  }
}
