import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_internal/iot_internal.dart';

class DataSources {
  DataSources({
    required this.communicatorService,
    required this.channelProvider,
    required this.channelStateWatcher,
    required this.channelRunner,
    required this.sharedPersistent,
  });

  final IotCommunicatorService communicatorService;
  final IotChannelProvider channelProvider;
  final ChannelStateWatcher channelStateWatcher;
  final Runnable channelRunner;
  final SharedPersistent sharedPersistent;
}
