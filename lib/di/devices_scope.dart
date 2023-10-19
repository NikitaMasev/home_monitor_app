import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_client_starter/iot_client_starter.dart';

class DevicesScope extends StatelessWidget {
  const DevicesScope({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) => BlocProvider<IotDevicesBloc>(
        create: (final ctx) => IotDevicesBloc(
          devicesRepository: ctx.read<DevicesRepository>(),
          clientRepository: ctx.read<ClientRepository>(),
        ),
        child: child,
      );
}
