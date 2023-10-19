import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iot_client_starter/iot_client_starter.dart';

class AuthScope extends StatelessWidget {
  const AuthScope({
    required this.child,
    required this.name,
    final Key? key,
  }) : super(key: key);

  final Widget child;
  final String name;

  @override
  Widget build(final BuildContext context) => BlocProvider<AuthBloc>(
        create: (final ctx) => AuthBloc(
          userRepository: ctx.read<UserRepository>(),
          name: name,
          iotStateRepository: ctx.read<IotStateRepository>(),
          clientRepository: ctx.read<ClientRepository>(),
        ),
        child: child,
      );
}
