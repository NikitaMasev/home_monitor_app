import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/di/channel_state_scope.dart';
import 'package:home_monitor/presentation/components/splash_component.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(final BuildContext context) => const Scaffold(
        body: ChannelStateScope(
          child: SplashComponent(),
        ),
      );
}
