import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:home_monitor/internal/router/app_router.dart';
import 'package:home_monitor/presentation/assets_paths/assets.gen.dart';

@RoutePage()
class HomePage extends StatelessWidget {
  const HomePage();

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
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  label: 'Устройства',
                  icon: Assets.svg.iot.svg(),
                  activeIcon: Assets.svg.iotSelected.svg(
                    color: colorScheme.primary,
                  ),
                ),
                BottomNavigationBarItem(
                  label: 'Уведомления',
                  icon: Assets.svg.bells.svg(),
                  activeIcon: Assets.svg.bellsSelected.svg(
                    color: colorScheme.primary,
                  ),
                ),
              ],
            ),
          );
        },
      );
}


