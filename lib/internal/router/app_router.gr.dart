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
    LedCctDetailRoute.name: (routeData) {
      final args = routeData.argsAs<LedCctDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LedCctDetailPage(
          iotDevicesBloc: args.iotDevicesBloc,
          ledCctData: args.ledCctData,
          idDevice: args.idDevice,
        ),
      );
    },
    NotificationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: NotificationsPage(),
      );
    },
    RgbAddressDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RgbAddressDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RgbAddressDetailPage(
          iotDevicesBloc: args.iotDevicesBloc,
          ledData: args.ledData,
          idDevice: args.idDevice,
        ),
      );
    },
    RgbDetailRoute.name: (routeData) {
      final args = routeData.argsAs<RgbDetailRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RgbDetailPage(
          iotDevicesBloc: args.iotDevicesBloc,
          ledData: args.ledData,
          idDevice: args.idDevice,
        ),
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
/// [LedCctDetailPage]
class LedCctDetailRoute extends PageRouteInfo<LedCctDetailRouteArgs> {
  LedCctDetailRoute({
    required IotDevicesBloc iotDevicesBloc,
    required LedCctData ledCctData,
    required int idDevice,
    List<PageRouteInfo>? children,
  }) : super(
          LedCctDetailRoute.name,
          args: LedCctDetailRouteArgs(
            iotDevicesBloc: iotDevicesBloc,
            ledCctData: ledCctData,
            idDevice: idDevice,
          ),
          initialChildren: children,
        );

  static const String name = 'LedCctDetailRoute';

  static const PageInfo<LedCctDetailRouteArgs> page =
      PageInfo<LedCctDetailRouteArgs>(name);
}

class LedCctDetailRouteArgs {
  const LedCctDetailRouteArgs({
    required this.iotDevicesBloc,
    required this.ledCctData,
    required this.idDevice,
  });

  final IotDevicesBloc iotDevicesBloc;

  final LedCctData ledCctData;

  final int idDevice;

  @override
  String toString() {
    return 'LedCctDetailRouteArgs{iotDevicesBloc: $iotDevicesBloc, ledCctData: $ledCctData, idDevice: $idDevice}';
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
/// [RgbAddressDetailPage]
class RgbAddressDetailRoute extends PageRouteInfo<RgbAddressDetailRouteArgs> {
  RgbAddressDetailRoute({
    required IotDevicesBloc iotDevicesBloc,
    required LedData ledData,
    required int idDevice,
    List<PageRouteInfo>? children,
  }) : super(
          RgbAddressDetailRoute.name,
          args: RgbAddressDetailRouteArgs(
            iotDevicesBloc: iotDevicesBloc,
            ledData: ledData,
            idDevice: idDevice,
          ),
          initialChildren: children,
        );

  static const String name = 'RgbAddressDetailRoute';

  static const PageInfo<RgbAddressDetailRouteArgs> page =
      PageInfo<RgbAddressDetailRouteArgs>(name);
}

class RgbAddressDetailRouteArgs {
  const RgbAddressDetailRouteArgs({
    required this.iotDevicesBloc,
    required this.ledData,
    required this.idDevice,
  });

  final IotDevicesBloc iotDevicesBloc;

  final LedData ledData;

  final int idDevice;

  @override
  String toString() {
    return 'RgbAddressDetailRouteArgs{iotDevicesBloc: $iotDevicesBloc, ledData: $ledData, idDevice: $idDevice}';
  }
}

/// generated route for
/// [RgbDetailPage]
class RgbDetailRoute extends PageRouteInfo<RgbDetailRouteArgs> {
  RgbDetailRoute({
    required IotDevicesBloc iotDevicesBloc,
    required LedData ledData,
    required int idDevice,
    List<PageRouteInfo>? children,
  }) : super(
          RgbDetailRoute.name,
          args: RgbDetailRouteArgs(
            iotDevicesBloc: iotDevicesBloc,
            ledData: ledData,
            idDevice: idDevice,
          ),
          initialChildren: children,
        );

  static const String name = 'RgbDetailRoute';

  static const PageInfo<RgbDetailRouteArgs> page =
      PageInfo<RgbDetailRouteArgs>(name);
}

class RgbDetailRouteArgs {
  const RgbDetailRouteArgs({
    required this.iotDevicesBloc,
    required this.ledData,
    required this.idDevice,
  });

  final IotDevicesBloc iotDevicesBloc;

  final LedData ledData;

  final int idDevice;

  @override
  String toString() {
    return 'RgbDetailRouteArgs{iotDevicesBloc: $iotDevicesBloc, ledData: $ledData, idDevice: $idDevice}';
  }
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
