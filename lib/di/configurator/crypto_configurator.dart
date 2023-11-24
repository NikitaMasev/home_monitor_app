import 'package:home_monitor/di/models/environments.dart';
import 'package:iot_internal/iot_internal.dart';

class CryptoConfigurator {
  CryptoConfigurator(this._env);

  final Env _env;

  Future<Crypto> getCrypto() async {
    final (key, iv) = _getKeyIv();
    return switch (_env) {
      Env.stage => CryptoImpl(key: key, iv: iv),
      Env.prod => CryptoImpl(key: key, iv: iv),
      Env.dev => CryptoImpl(key: key, iv: iv),
      Env.test => CryptoImpl(key: key, iv: iv),
    };
  }

  Future<Crypto> getCryptoUpgrade() async {
    final (key, iv) = _getKeyIvUpgrade();
    return switch (_env) {
      Env.stage => CryptoImpl(key: key, iv: iv),
      Env.prod => CryptoImpl(key: key, iv: iv),
      Env.dev => CryptoImpl(key: key, iv: iv),
      Env.test => CryptoImpl(key: key, iv: iv),
    };
  }

  (String key, String iv) _getKeyIv() {
    const secKey = String.fromEnvironment('SEC_KEY');
    const iVKey = String.fromEnvironment('SEC_IV');
    return (secKey, iVKey);
  }

  (String key, String iv) _getKeyIvUpgrade() {
    const secKey = String.fromEnvironment('SEC_KEY_UPGRADE');
    const iVKey = String.fromEnvironment('SEC_IV_UPGRADE');
    return (secKey, iVKey);
  }
}
