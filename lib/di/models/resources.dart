import 'package:home_monitor/di/configurator/repositories_creator.dart';
import 'package:home_monitor/di/models/data_sources.dart';
import 'package:home_monitor/di/models/environments.dart';

class Resources {
  Resources({
    required this.repositoriesCreator,
    required this.dataSources,
    required this.env,
    required this.logger,
  });

  final RepositoriesCreator repositoriesCreator;
  final DataSources dataSources;
  final Env env;
  final bool logger;
}
