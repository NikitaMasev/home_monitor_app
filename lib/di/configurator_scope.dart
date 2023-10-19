import 'package:flutter/material.dart';
import 'package:home_monitor/di/configurator/resources_configurator.dart';
import 'package:home_monitor/di/models/environments.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:provider/provider.dart';

class ConfiguratorScope extends StatefulWidget {
  const ConfiguratorScope({
    required this.child,
    required this.env,
    required this.initialized,
    this.logger = false,
  });

  final Widget child;
  final Env env;
  final VoidCallback initialized;
  final bool logger;

  @override
  State<ConfiguratorScope> createState() => _ConfiguratorScopeState();
}

class _ConfiguratorScopeState extends State<ConfiguratorScope> {
  Resources? _resources;

  @override
  void initState() {
    super.initState();
    initialization();
  }

  Future<void> initialization() async {
    _resources = await ResourcesConfigurator(
      env: widget.env,
      useLogging: widget.logger,
    ).getResources();

    widget.initialized();
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) => _resources != null
      ? Provider<Resources>.value(
          value: _resources!,
          child: widget.child,
        )
      : const SizedBox.shrink();
}
