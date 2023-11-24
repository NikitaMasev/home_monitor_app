import 'package:flutter/material.dart';
import 'package:home_monitor/data/repo/app_upgrade_repository.dart';
import 'package:home_monitor/di/models/resources.dart';
import 'package:provider/provider.dart';

class AppUpgradeRepoScope extends StatelessWidget {
  const AppUpgradeRepoScope({
    required this.child,
    final Key? key,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(final BuildContext context) => Provider<AppUpgradeRepository>(
        create: (final ctx) =>
            ctx.read<Resources>().repositories.appUpgradeRepository,
        child: child,
      );
}
