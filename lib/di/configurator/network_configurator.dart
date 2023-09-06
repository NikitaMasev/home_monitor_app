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

  Future<(IotChannelProvider, ChannelStateWatcher)>
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

  String _getIp() => switch (_env) {
        Env.stage => 'ws://192.168.50.143',
        Env.prod => 'ws://192.168.50.143',
        Env.dev => 'ws://192.168.50.143',
        Env.test => 'ws://localhost',
      };

  String _getPort() => switch (_env) {
        Env.stage => '5090',
        Env.prod => '5090',
        Env.dev => '5090',
        Env.test => '5090',
      };
}
