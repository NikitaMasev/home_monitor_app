import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_monitor/data/repo/app_upgrade_repository.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:home_monitor/domain/platform_upgrade/platform_upgrade_bloc.dart';

class PlatformUpgradeScope extends StatelessWidget {
  const PlatformUpgradeScope({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) => BlocProvider<PlatformUpgradeBloc>(
        create: (final ctx) => PlatformUpgradeBloc(
          ctx.read<AppUpgradeRepository>(),
          ctx.read<Resources>().appUpgradorService,
        ),
        child: child,
      );
}
