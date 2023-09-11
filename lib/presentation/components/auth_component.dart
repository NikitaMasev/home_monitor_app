import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/models/auth_state_ui.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:provider/provider.dart';

class AuthComponent extends StatefulWidget {
  const AuthComponent({
    required this.onSuccess,
    final Key? key,
  }) : super(key: key);

  final VoidCallback onSuccess;

  @override
  State<AuthComponent> createState() => _AuthComponentState();
}

class _AuthComponentState extends State<AuthComponent> {
  final _controllerAuthStateUi = StreamController<AuthStateUi>();
  late final StreamSubscription _subBloc;
  late final AuthBloc _authBloc;

  @override
  void initState() {
    _authBloc = context.read<AuthBloc>();
    _subBloc = _authBloc.stream.listen(
      (final state) => state.when(
        initial: () => _controllerAuthStateUi.add(AuthStateUiInitial()),
        loading: () => _controllerAuthStateUi.add(AuthStateUiLoading()),
        success: () => _controllerAuthStateUi.add(AuthStateUiSuccess()),
        error: (final err) => _controllerAuthStateUi.add(
          AuthStateUiError(
            err: err.toString(),
          ),
        ),
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _subBloc.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => StreamBuilder<AuthStateUi>(
        stream: _controllerAuthStateUi.stream,
        initialData: AuthStateUiInitial(),
        builder: (final ctx, final snap)=>switch(snap.data!){
          // TODO: Handle this case.
          AuthStateUiInitial() => null,
          // TODO: Handle this case.
          AuthStateUiLoading() => null,
          // TODO: Handle this case.
          AuthStateUiError() => null,
          // TODO: Handle this case.
          AuthStateUiSuccess() => null,
        },
      );
}
