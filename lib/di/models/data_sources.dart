import 'package:iot_client_starter/iot_client_starter.dart';

class DataSources {
  DataSources({
    required this.communicatorService,
    required this.channelProvider,
    required this.channelStateWatcher,
  });

  final IotCommunicatorService communicatorService;
  final IotChannelProvider channelProvider;
  final ChannelStateWatcher channelStateWatcher;
}
