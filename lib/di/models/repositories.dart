import 'package:iot_client_starter/iot_client_starter.dart';

class Repositories {
  Repositories({
    required this.userRepository,
    required this.clientRepository,
    required this.devicesRepository,
    required this.iotStateRepository,
  });

  final UserRepository userRepository;
  final ClientRepository clientRepository;
  final DevicesRepository devicesRepository;
  final IotStateRepository iotStateRepository;
}
