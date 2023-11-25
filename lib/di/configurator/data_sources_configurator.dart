import 'package:dfa_common/dfa_common.dart';
import 'package:dio/dio.dart';
import 'package:home_monitor/data/sources/dfa/dfa_client.dart';
import 'package:home_monitor/data/sources/dfa/dfa_client_impl.dart';
import 'package:home_monitor/data/sources/shared_platform_persistent_impl.dart';
import 'package:home_monitor/di/configurator/crypto_configurator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/internal/platform/build_abi_extractor.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DataSourcesConfigurator {
  DataSourcesConfigurator({
    required final Env env,
    required final CryptoConfigurator cryptoConfigurator,
    required final BuildAbiExtractor buildAbiExtractor,
  })  : _env = env,
        _cryptoConfigurator = cryptoConfigurator,
        _buildAbiExtractor = buildAbiExtractor;

  final Env _env;
  final CryptoConfigurator _cryptoConfigurator;
  final BuildAbiExtractor _buildAbiExtractor;

  Future<SharedPersistent> sharedPersistent() async =>
      SharedPlatformPersistentImpl(
        shared: await SharedPreferences.getInstance(),
      );

  Future<Map<String, dynamic>> _headersDioDfa() async {
    final crypto = await _cryptoConfigurator.getCryptoUpgrade();
    final (build, abi) = await _buildAbiExtractor.getBuildAbi();
    final buildEncr = crypto.encrypt(build);
    final abiEncr = crypto.encrypt(abi);

    return <String, dynamic> {
      RequestUpgradeHeaders.buildVersion: buildEncr,
      RequestUpgradeHeaders.abi: abiEncr,
      'buildNoEncr':build,
      'abiNoEncr':abi,
    };
  }

  Future<Dio> _dioDfaRemote() async => Dio(
        BaseOptions(
          baseUrl: 'http://192.168.50.143:$portUpgrade',
          headers: await _headersDioDfa(),
          responseType: ResponseType.bytes,
        ),
      );

  Future<Dio> _dioDfaLocal() async => Dio(
        BaseOptions(
          baseUrl: 'http://192.168.50.143:$portUpgrade',
          headers: await _headersDioDfa(),
          responseType: ResponseType.bytes,
        ),
      );

  Future<DfaClient> dfaClientRemote() async => DfaClientImpl(
        dio: await _dioDfaRemote(),
      );

  Future<DfaClient> dfaClientLocal() async => DfaClientImpl(
        dio: await _dioDfaLocal(),
      );

  String get ipLocal => const String.fromEnvironment('IP_LOCAL');

  String get ipRemote => const String.fromEnvironment('IP_REMOTE');

  String get port => const String.fromEnvironment('PORT');

  String get portUpgrade => const String.fromEnvironment('PORT_UPGRADE');
}
