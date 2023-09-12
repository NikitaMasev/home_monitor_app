import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/di/auth_scope.dart';
import 'package:home_monitor/di/channel_state_scope.dart';
import 'package:home_monitor/di/communicator_scope.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:home_monitor/di/user_repo_scope.dart';
import 'package:home_monitor/presentation/components/auth_component.dart';
import 'package:home_monitor/presentation/widgets/home_config.dart';
import 'package:provider/provider.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage();

  @override
  Widget build(final BuildContext context) => ChannelStateScope(
        child: CommunicatorScope(
          child: UserRepoScope(
            child: AuthScope(
              name: context.read<Resources>().nameDevice,
              child: const AuthComponent(
                childIfSuccess: HomeConfig(),
              ),
            ),
          ),
        ),
      );
}
