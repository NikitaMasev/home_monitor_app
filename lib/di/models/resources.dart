import 'package:home_monitor/di/models/data_sources.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/models/repositories.dart';

class Resources {
  Resources({
    required this.repositories,
    required this.dataSources,
    required this.env,
    required this.logger,
    required this.nameDevice,
  });

  final Repositories repositories;
  final DataSources dataSources;
  final Env env;
  final bool logger;
  final String nameDevice;
}
