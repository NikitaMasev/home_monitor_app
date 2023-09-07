import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_monitor/internal/router/app_router.dart';

@RoutePage()
class SplashPage extends StatelessWidget {
  const SplashPage();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Center(
            child: CircularProgressIndicator(),
          ),
          ElevatedButton(
            onPressed: () {
              context.router.push(const HomeRoute());
            },
            child: Text('TO HOME PAGE'),
          ),
        ],
      ),
    );
  }
}
