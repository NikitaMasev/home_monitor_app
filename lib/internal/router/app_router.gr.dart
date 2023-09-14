// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    DevicesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: DevicesPage(),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: HomePage(),
      );
    },
    LedAddressDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LedAddressDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LedAddressDetailPage(
          iotDevicesBloc: args.iotDevicesBloc,
          ledData: args.ledData,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationsPage(),
      );
    },
    SplashRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: SplashPage(),
      );
    },
  };
}

/// generated route for
/// [DevicesPage]
class DevicesRoute extends PageRouteInfo<void> {
  const DevicesRoute({List<PageRouteInfo>? children})
      : super(
          DevicesRoute.name,
          initialChildren: children,
        );

  static const String name = 'DevicesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LedAddressDetailPage]
class LedAddressDetailRoute extends PageRouteInfo<LedAddressDetailRouteArgs> {
  LedAddressDetailRoute({
    required IotDevicesBloc iotDevicesBloc,
    required LedData ledData,
    List<PageRouteInfo>? children,
  }) : super(
          LedAddressDetailRoute.name,
          args: LedAddressDetailRouteArgs(
            iotDevicesBloc: iotDevicesBloc,
            ledData: ledData,
          ),
          initialChildren: children,
        );

  static const String name = 'LedAddressDetailRoute';

  static const PageInfo<LedAddressDetailRouteArgs> page =
      PageInfo<LedAddressDetailRouteArgs>(name);
}

class LedAddressDetailRouteArgs {
  const LedAddressDetailRouteArgs({
    required this.iotDevicesBloc,
    required this.ledData,
  });

  final IotDevicesBloc iotDevicesBloc;

  final LedData ledData;

  @override
  String toString() {
    return 'LedAddressDetailRouteArgs{iotDevicesBloc: $iotDevicesBloc, ledData: $ledData}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [SplashPage]
class SplashRoute extends PageRouteInfo<void> {
  const SplashRoute({List<PageRouteInfo>? children})
      : super(
          SplashRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
