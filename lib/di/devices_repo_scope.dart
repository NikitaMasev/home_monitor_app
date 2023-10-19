import 'package:flutter/material.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:provider/provider.dart';

class DevicesRepoScope extends StatelessWidget {
  const DevicesRepoScope({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) => Provider<DevicesRepository>.value(
    value: context.read<Resources>().repositories.devicesRepository,
    child: child,
  );
}
