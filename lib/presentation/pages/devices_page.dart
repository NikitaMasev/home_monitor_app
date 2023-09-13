import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/di/devices_scope.dart';
import 'package:home_monitor/presentation/components/devices_component.dart';

@RoutePage()
class DevicesPage extends StatelessWidget {
  const DevicesPage();

  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: DevicesScope(
          child: DevicesComponent(),
        ),
      );
}
