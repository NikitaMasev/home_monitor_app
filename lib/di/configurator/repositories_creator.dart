import 'package:home_monitor/di/configurator/crypto_configurator.dart';
import 'package:home_monitor/di/configurator/data_sources_configurator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:iot_client_starter/data/repositories/user/user_repository_impl.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';

class RepositoriesCreator {
  RepositoriesCreator({
    required this.env,
    required this.cryptoConfigurator,
    required this.dataSourcesConfigurator,
  });

  final Env env;
  final CryptoConfigurator cryptoConfigurator;
  final DataSourcesConfigurator dataSourcesConfigurator;

  Future<UserRepository> userRepository() async => UserRepositoryImpl(
        await dataSourcesConfigurator.sharedPersistent(),
      );

  Future<
      (
        ClientRepository,
        DevicesRepository,
        IotStateRepository,
        Pausable,
        Resumable,
      )> iotDataRepository() async => configIotDataRepo(
        ipLocal: dataSourcesConfigurator.ipLocal,
        portLocal: dataSourcesConfigurator.portLocal,
        ipRemote: dataSourcesConfigurator.ipRemote,
        portRemote: dataSourcesConfigurator.portRemote,
        cryptoClients: await cryptoConfigurator.getCrypto(),
        useLogging: true,
      );
}
