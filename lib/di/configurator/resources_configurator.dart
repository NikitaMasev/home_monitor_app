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
    required final bool useLogging,
  })  : _env = env,
        _useLogging = useLogging;

  final Env _env;
  final bool _useLogging;

  Future<Resources> getResources() async {
    final cryptoConfig = CryptoConfigurator(_env);
    final dataSourcesConfig = DataSourcesConfigurator(_env);
    final repositoriesCreator = RepositoriesCreator(
      env: _env,
      cryptoConfigurator: cryptoConfig,
      dataSourcesConfigurator: dataSourcesConfig,
      useLogging: _useLogging,
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
      useLogging: _useLogging,
      nameDevice: nameDevice,
      pausableResources: [pausable],
      resumableResources: [resumable],
    );
  }
}
