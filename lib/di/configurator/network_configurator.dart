import 'package:home_monitor/di/models/environments.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';

class NetworkConfigurator {
  NetworkConfigurator(this._env, this._crypto);

  final Env _env;
  final Crypto _crypto;

  Future<IotCommunicatorService> getCommunicatorService(
    final IotChannelProvider iotChannelProvider,
  ) =>
      configCommunicator(iotChannelProvider);

  Future<(IotChannelProvider, ChannelStateWatcher, Runnable)>
      getChannelProviderAndStateWatcher() => switch (_env) {
            Env.stage => configChannelProvider(
                ipClients: _getIp(),
                portClients: _getPort(),
                cryptoClients: _crypto,
              ),
            Env.prod => configChannelProvider(
                ipClients: _getIp(),
                portClients: _getPort(),
                cryptoClients: _crypto,
                useLogging: true,
              ),
            Env.dev => configChannelProvider(
                ipClients: _getIp(),
                portClients: _getPort(),
                cryptoClients: _crypto,
              ),
            Env.test => configChannelProvider(
                ipClients: _getIp(),
                portClients: _getPort(),
                cryptoClients: _crypto,
              ),
          };

  String _getIp() => const String.fromEnvironment('IP');

  String _getPort() => const String.fromEnvironment('PORT');
}
