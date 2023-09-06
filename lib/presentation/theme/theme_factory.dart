import 'package:home_monitor/presentation/theme/theme_dark_holder.dart';
import 'package:home_monitor/presentation/theme/theme_holder.dart';
import 'package:home_monitor/presentation/theme/theme_light_holder.dart';

abstract final interface class ThemeFactory {
  static ThemeHolder createDarkTheme() => ThemeDarkHolder();

  static ThemeHolder createLightTheme() => ThemeLightHolder();
}
