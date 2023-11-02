// ignore_for_file: avoid_function_literals_in_foreach_calls

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:iot_internal/iot_internal.dart';
import 'package:provider/provider.dart';

class AppLifeCycleResources extends StatefulWidget {
  const AppLifeCycleResources({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AppLifeCycleResources> createState() => _AppLifeCycleResourcesState();
}

class _AppLifeCycleResourcesState extends State<AppLifeCycleResources>
    with WidgetsBindingObserver {
  late final List<Pausable> _pausableSources;
  late final List<Resumable> _resumableSources;

  Timer? _timerPauseSources;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _pausableSources = context.read<Resources>().pausableResources;
    _resumableSources = context.read<Resources>().resumableResources;
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    if (state == AppLifecycleState.paused) {
      _timerPauseSources?.cancel();
      _timerPauseSources = Timer(const Duration(minutes: 2), () {
        _pausableSources.forEach((final element) => element.pause());
      });
    } else if (state == AppLifecycleState.resumed) {
      _timerPauseSources?.cancel();
      _resumableSources.forEach((final element) => element.resume());
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _timerPauseSources?.cancel();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => widget.child;
}
