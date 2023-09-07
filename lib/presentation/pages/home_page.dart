import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
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
          return Scaffold(
            body: child,
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: tabsRouter.activeIndex,
              onTap: tabsRouter.setActiveIndex,
              items: [
                BottomNavigationBarItem(
                  label: 'Устройства',
                  icon: Assets.svg.iot.svg(),
                ),
                BottomNavigationBarItem(
                  label: 'Уведомления',
                  icon: Assets.svg.notifications.svg(),
                ),
              ],
            ),
          );
        },
      );
}

// CircularBottomNavigation(
// [
// TabItem(Icons.ad_units, 'Устройства', Colors.red),
// TabItem(Icons.notification_add_outlined, 'Уведомления', Colors.red),
// ],
// selectedCallback: (final index) => tabsRouter.setActiveIndex(
// index ?? 0,
// ),
// selectedPos: tabsRouter.activeIndex,
// ),
