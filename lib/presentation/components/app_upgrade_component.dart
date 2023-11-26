import 'dart:async';
import 'dart:io' show Platform;

import 'package:flutter/material.dart';
import 'package:home_monitor/domain/platform_upgrade/platform_upgrade_bloc.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:provider/provider.dart';
import 'package:r_upgrade/r_upgrade.dart';

class AppUpgradeComponent extends StatefulWidget {
  const AppUpgradeComponent({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  State<AppUpgradeComponent> createState() => _AppUpgradeComponentState();
}

class _AppUpgradeComponentState extends State<AppUpgradeComponent> {
  late final PlatformUpgradeBloc _platformUpgradeBloc;
  StreamSubscription? _subBloc;

  @override
  void dispose() {
    _subBloc?.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _platformUpgradeBloc = context.read<PlatformUpgradeBloc>();
    _updateFlow();
    super.initState();
  }

  void _subscribePlatformUpgradeBloc() {
    _subBloc = _platformUpgradeBloc.stream.listen(
      (final state) => state.when(
        loading: () {},
        noNeedUpgrade: () {},
        upgradeAvailable: () {},
        downloadingUpgrade: (final progress) {
          print('progress $progress');
        },
        downloadingUpgradeCompleted: () {},
        upgradeSuccess: () {},
        upgradeError: (final err) {},
        error: (final err) {},
      ),
    );
  }

  Future<void> _updateFlow() async {
    await Future.delayed(const Duration(seconds: 5));
    await Permission.requestInstallPackages
        .request()
        .then((final permissionStatus) async {
      if (permissionStatus.isGranted) {
        if (Platform.isAndroid) {
          await RUpgrade.upgrade(
            'http://192.168.50.143:4500/upgrade',
            header: {
              'abi': 'Q2lPbeMtI+0ExcsaJ5ot+g==',
            },
            fileName: 'hui.apk',
          );
/*          _subscribePlatformUpgradeBloc();
          _platformUpgradeBloc.add(const PlatformUpgradeEvent.check());*/
        }
      }
    });
  }

  @override
  Widget build(final BuildContext context) => widget.child;
}
