import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DevicesPage extends StatelessWidget {
  const DevicesPage();

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
              context.tabsRouter.setActiveIndex(1);
            },
            child: Text('TO NOTIFICATIONS PAGE'),
          ),
        ],
      ),
    );
  }
}
