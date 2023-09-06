import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/theme/theme_options.dart';

abstract interface class ThemeHolder {
  ThemeData getTheme();

  ThemeOptions getThemeOptions();

  abstract final String themeId;
}
