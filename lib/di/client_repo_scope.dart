import 'package:flutter/material.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:iot_client_starter/data/repositories/iot_data/client_repository.dart';
import 'package:provider/provider.dart';

class ClientRepoScope extends StatelessWidget {
  const ClientRepoScope({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) => Provider<ClientRepository>.value(
        value: context.read<Resources>().repositories.clientRepository,
        child: child,
      );
}
