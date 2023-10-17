import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';

class DataSources {
  DataSources({
    required this.communicatorService,
    required this.channelProvider,
    required this.channelStateWatcher,
    required this.channelRunner,
    required this.sharedPersistent,
    required this.pausableSources,
    required this.resumableSources,
  });

  final IotCommunicatorService communicatorService;
  final IotChannelProvider channelProvider;
  final ChannelStateWatcher channelStateWatcher;
  final Runnable channelRunner;
  final SharedPersistent sharedPersistent;
  final List<Pausable> pausableSources;
  final List<Resumable> resumableSources;
}
