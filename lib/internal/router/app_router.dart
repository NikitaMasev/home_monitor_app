import 'package:auto_route/auto_route.dart';
import 'package:home_monitor/presentation/pages/details/led_address_detail_page.dart';
import 'package:home_monitor/presentation/pages/devices_page.dart';
import 'package:home_monitor/presentation/pages/home_page.dart';
import 'package:home_monitor/presentation/pages/notifications_page.dart';
import 'package:home_monitor/presentation/pages/splash_page.dart';
import 'package:iot_client_starter/iot_client_starter.dart';
import 'package:iot_models/iot_models.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends _$AppRouter {
  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      path: '/home',
      page: HomeRoute.page,
      children: [
        AutoRoute(path: 'devices', page: DevicesRoute.page),
        AutoRoute(path: 'notifications', page: NotificationsRoute.page),
      ],
    ),
    AutoRoute(path: '/', page: SplashRoute.page),
    AutoRoute(path: '/led_address_detail', page: LedAddressDetailRoute.page),
  ];
}
