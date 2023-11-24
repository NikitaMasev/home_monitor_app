import 'package:home_monitor/data/repo/app_upgrade_repository.dart';
import 'package:iot_client_starter/iot_client_starter.dart';

class Repositories {
  Repositories({
    required this.userRepository,
    required this.clientRepository,
    required this.devicesRepository,
    required this.iotStateRepository,
    required this.appUpgradeRepository,
  });

  final UserRepository userRepository;
  final ClientRepository clientRepository;
  final DevicesRepository devicesRepository;
  final IotStateRepository iotStateRepository;
  final AppUpgradeRepository appUpgradeRepository;
}
