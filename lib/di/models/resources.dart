import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/models/repositories.dart';
import 'package:iot_internal/iot_internal.dart';

class Resources {
  Resources({
    required this.repositories,
    required this.env,
    required this.useLogging,
    required this.nameDevice,
    required this.pausableResources,
    required this.resumableResources,
  });

  final Repositories repositories;
  final List<Pausable> pausableResources;
  final List<Resumable> resumableResources;
  final Env env;
  final bool useLogging;
  final String nameDevice;
}
