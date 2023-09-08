import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DevicesPage extends StatelessWidget {
  const DevicesPage();

  @override
  Widget build(final BuildContext context) {
    print('DevicesPage BUILD');
    return Scaffold(
      //backgroundColor: Colors.black.withOpacity(0.9),
      body: Column(
        children: [
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
