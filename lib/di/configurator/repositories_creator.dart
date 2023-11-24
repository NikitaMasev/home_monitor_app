import 'package:home_monitor/data/repo/app_upgrade_repository.dart';
import 'package:home_monitor/data/repo/app_upgrade_repository_impl.dart';
import 'package:home_monitor/di/configurator/crypto_configurator.dart';
import 'package:home_monitor/di/configurator/data_sources_configurator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:iot_client_starter/data/repositories/user/user_repository_impl.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';

class RepositoriesCreator {
  RepositoriesCreator({
    required final Env env,
    required final CryptoConfigurator cryptoConfigurator,
    required final DataSourcesConfigurator dataSourcesConfigurator,
    required final bool useLogging,
  })  : _env = env,
        _cryptoConfigurator = cryptoConfigurator,
        _dataSourcesConfigurator = dataSourcesConfigurator,
        _useLogging = useLogging;

  final Env _env;
  final CryptoConfigurator _cryptoConfigurator;
  final DataSourcesConfigurator _dataSourcesConfigurator;
  final bool _useLogging;

  Future<UserRepository> userRepository() async => UserRepositoryImpl(
        await _dataSourcesConfigurator.sharedPersistent(),
      );

  Future<
      (
        ClientRepository,
        DevicesRepository,
        IotStateRepository,
        Pausable,
        Resumable,
      )> iotDataRepository() async => configIotDataRepo(
        ipLocal: _dataSourcesConfigurator.ipLocal,
        portLocal: _dataSourcesConfigurator.port,
        ipRemote: _dataSourcesConfigurator.ipRemote,
        portRemote: _dataSourcesConfigurator.port,
        cryptoClients: await _cryptoConfigurator.getCrypto(),
        useLogging: _useLogging,
      );

  Future<AppUpgradeRepository> appUpgradeRepo() async =>
      AppUpgradeRepositoryImpl(
        dfaClientLocal: await _dataSourcesConfigurator.dfaClientLocal(),
        dfaClientRemote: await _dataSourcesConfigurator.dfaClientRemote(),
      );
}
