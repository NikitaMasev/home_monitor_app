import 'package:flutter/material.dart';

class DeviceItemCarcass extends StatelessWidget {
  const DeviceItemCarcass({
    required this.name,
    required this.icon,
    required this.bottom,
    required this.size,
    final Key? key,
  }) : super(key: key);

  final String name;
  final Widget icon;
  final Widget bottom;
  final double size;

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: Card(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 8, right: 8, top: 4),
              child: Text(
                name,
                maxLines: 1,
              ),
            ),
            icon,
            bottom,
          ],
        ),
        color: Theme.of(context).colorScheme.surfaceVariant,
        elevation: 0,
      ),
    );
  }
}
