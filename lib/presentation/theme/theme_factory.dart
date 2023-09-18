// ignore_for_file: avoid_classes_with_only_static_members

import 'package:home_monitor/presentation/theme/theme_dark_holder.dart';
import 'package:home_monitor/presentation/theme/theme_light_holder.dart';

abstract final interface class ThemeFactory {
  static ThemeDarkHolder createDarkTheme() => ThemeDarkHolder();

  static ThemeLightHolder createLightTheme() => ThemeLightHolder();
}
