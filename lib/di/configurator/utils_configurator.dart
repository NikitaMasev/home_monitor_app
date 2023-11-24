import 'package:dart_ping/dart_ping.dart';
import 'package:home_monitor/di/models/environments.dart';

final class UtilsConfigurator {
  UtilsConfigurator(this._env);

  final Env _env;

  Future<Ping> configPing(final String host, final int count) async => Ping(
        host,
        count: count,
      );
}
