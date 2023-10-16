import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';

class HomeConfig extends StatelessWidget {
  const HomeConfig({super.key});

  @override
  Widget build(final BuildContext context) => AutoTabsRouter(
        routes: const [
          DevicesRoute(),
          NotificationsRoute(),
        ],
        transitionBuilder: (final context, final child, final animation) =>
            FadeTransition(
          opacity: animation,
          child: child,
        ),
        builder: (final context, final child) {
          final tabsRouter = AutoTabsRouter.of(context);
          final colorScheme = Theme.of(context).colorScheme;
          return Scaffold(
            body: child,
            bottomNavigationBar: NavigationBar(
              onDestinationSelected: tabsRouter.setActiveIndex,
              selectedIndex: tabsRouter.activeIndex,
              height: 70,
              destinations: <Widget>[
                NavigationDestination(
                  label: 'Устройства',
                  icon: Assets.svg.iotSelected.svg(
                    colorFilter: ColorFilter.mode(
                      colorScheme.secondaryContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                  selectedIcon: Assets.svg.iot.svg(
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSecondaryContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
                NavigationDestination(
                  label: 'Уведомления',
                  icon: Assets.svg.bellsSelected.svg(
                    colorFilter: ColorFilter.mode(
                      colorScheme.secondaryContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                  selectedIcon: Assets.svg.bells.svg(
                    colorFilter: ColorFilter.mode(
                      colorScheme.onSecondaryContainer,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      );
}
