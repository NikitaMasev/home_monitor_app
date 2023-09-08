import 'package:flutter/material.dart';

class ScrollNonStretching extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
    final BuildContext context,
    final Widget child,
    final ScrollableDetails details,
  ) => child;
}
