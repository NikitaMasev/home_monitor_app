import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:home_monitor/presentation/components/splash_component.dart';
import 'package:provider/provider.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(final BuildContext context) => Scaffold(
        body: SplashComponent(
          channelStateWatcher:
              context.read<Resources>().dataSources.channelStateWatcher,
        ),
      );
}
