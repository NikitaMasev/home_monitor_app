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

  (String key, String iv) _getKeyIv() => switch (_env) {
        Env.stage => ('0123456789561011', '0123456789561011'),
        Env.prod => ('0123456789561011', '0123456789561011'),
        Env.dev => ('0123456789561011', '0123456789561011'),
        Env.test => ('0123456789561011', '0123456789561011'),
      };
}
