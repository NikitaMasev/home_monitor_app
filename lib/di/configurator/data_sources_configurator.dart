import 'package:home_monitor/data/sources/shared_platform_persistent_impl.dart';
import 'package:home_monitor/di/configurator/crypto_configurator.dart';
import 'package:home_monitor/di/configurator/network_configurator.dart';
import 'package:home_monitor/di/models/data_sources.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSourcesConfigurator {
  DataSourcesConfigurator(
    this._env,
  );

  final Env _env;

  Future<DataSources> getDataSources() async {
    final cryptoConfig = CryptoConfigurator(_env);
    final crypto = await cryptoConfig.getCrypto();

    final networkConfig = NetworkConfigurator(_env, crypto);
    final (channelProvider, channelStateWatcher, channelRunner) =
        await networkConfig.getChannelProviderAndStateWatcher();
    final communicatorService =
        await networkConfig.getCommunicatorService(channelProvider);
    final shared = await SharedPreferences.getInstance();
    final sharedPersistent = SharedPlatformPersistentImpl(shared: shared);

    return DataSources(
      communicatorService: communicatorService,
      channelProvider: channelProvider,
      channelStateWatcher: channelStateWatcher,
      channelRunner: channelRunner,
      sharedPersistent: sharedPersistent,
    );
  }
}
