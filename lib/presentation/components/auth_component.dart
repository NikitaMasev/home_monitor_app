import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/models/auth_state_ui.dart';
import 'package:home_monitor/presentation/models/loader_state.dart';
import 'package:home_monitor/presentation/widgets/loaders/loader_entity.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:provider/provider.dart';

class AuthComponent extends StatefulWidget {
  const AuthComponent({
    this.onSuccess,
    this.childIfSuccess,
    final Key? key,
  }) : super(key: key);

  final VoidCallback? onSuccess;
  final Widget? childIfSuccess;

  @override
  State<AuthComponent> createState() => _AuthComponentState();
}

class _AuthComponentState extends State<AuthComponent>
    with WidgetsBindingObserver {
  final _controllerAuthStateUi = StreamController<AuthStateUi>();

  late final StreamSubscription _subBloc;
  late final AuthBloc _authBloc;

  Timer? _timerUpdateAppState;
  var _appResumed = true;

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    print('APPSTATE $state');
    if (state == AppLifecycleState.resumed) {
      _timerUpdateAppState = Timer(const Duration(milliseconds: 500), () {
        _appResumed = true;
      });
    } else {
      _appResumed = false;
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _authBloc = context.read<AuthBloc>();
    _subBloc = _authBloc.stream.listen(
      (final state) => state.when(
        initial: () => _controllerAuthStateUi.add(AuthStateUiInitial()),
        loading: () => _controllerAuthStateUi.add(AuthStateUiLoading()),
        success: () {
          _controllerAuthStateUi.add(AuthStateUiSuccess());
          widget.onSuccess?.call();
        },
        error: (final err) {
          if (_appResumed) {
            _controllerAuthStateUi.add(
              AuthStateUiError(
                err: err.err,
              ),
            );
          }
        },
      ),
    );
    _authBloc.add(const AuthEvent.start());
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _subBloc.cancel();
    _timerUpdateAppState?.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: LoaderEntity(
          childIfSuccess: widget.childIfSuccess,
          stream: _controllerAuthStateUi.stream.map(
            (final uiState) => switch (uiState) {
              AuthStateUiInitial() => LoaderStateInitial(),
              AuthStateUiLoading() => LoaderStateLoading(),
              AuthStateUiError() => LoaderStateError(err: uiState.err),
              AuthStateUiSuccess() => LoaderStateSuccess(),
            },
          ),
        ),
      );
}
