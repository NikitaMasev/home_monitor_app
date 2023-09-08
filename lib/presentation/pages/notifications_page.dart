import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class NotificationsPage extends StatelessWidget {
  const NotificationsPage();

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      //backgroundColor: Colors.black.withOpacity(0.9),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.tabsRouter.setActiveIndex(0);
            },
            child: Text('TO DEVICES PAGE'),
          ),
        ],
      ),
    );
  }
}
