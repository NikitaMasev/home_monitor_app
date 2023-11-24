import 'package:home_monitor/di/configurator/crypto_configurator.dart';
import 'package:home_monitor/di/configurator/data_sources_configurator.dart';
import 'package:home_monitor/di/configurator/repositories_creator.dart';
import 'package:home_monitor/di/configurator/services_configurator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/models/repositories.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:home_monitor/internal/platform/build_abi_extractor.dart';
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

    final dataSourcesConfig = DataSourcesConfigurator(
      env: _env,
      cryptoConfigurator: cryptoConfig,
      buildAbiExtractor: const BuildAbiExtractor(),
    );

    final repositoriesCreator = RepositoriesCreator(
      env: _env,
      cryptoConfigurator: cryptoConfig,
      dataSourcesConfigurator: dataSourcesConfig,
      useLogging: _useLogging,
    );

    final (
      clientRepository,
      devicesRepository,
      iotStateRepository,
      pausable,
      resumable
    ) = await repositoriesCreator.iotDataRepository();

    final nameDevice = await NameDeviceExtractor().getName();
    const servicesConfig = ServicesConfigurator();

    return Resources(
      repositories: Repositories(
        userRepository: await repositoriesCreator.userRepository(),
        clientRepository: clientRepository,
        devicesRepository: devicesRepository,
        iotStateRepository: iotStateRepository,
        appUpgradeRepository: await repositoriesCreator.appUpgradeRepo(),
      ),
      env: _env,
      useLogging: _useLogging,
      nameDevice: nameDevice,
      pausableResources: [pausable],
      resumableResources: [resumable],
      appUpgradorService: await servicesConfig.appUpgradorService(),
    );
  }
}
