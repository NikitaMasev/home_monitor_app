import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/theme/hex_color_converter.dart';
import 'package:home_monitor/presentation/theme/theme_holder.dart';
import 'package:home_monitor/presentation/theme/theme_options.dart';

const _darkColorScheme = ColorScheme(
  brightness: Brightness.dark,
  primary: Color(0xFF5ED4FF),
  onPrimary: Color(0xFF003545),
  primaryContainer: Color(0xFF004D63),
  onPrimaryContainer: Color(0xFFBBE9FF),
  secondary: Color(0xFF52D7F0),
  onSecondary: Color(0xFF00363F),
  secondaryContainer: Color(0xFF004E5A),
  onSecondaryContainer: Color(0xFFA5EEFF),
  tertiary: Color(0xFFAAD471),
  onTertiary: Color(0xFF203600),
  tertiaryContainer: Color(0xFF314F00),
  onTertiaryContainer: Color(0xFFC6F08A),
  error: Color(0xFFFFB4AB),
  errorContainer: Color(0xFF93000A),
  onError: Color(0xFF690005),
  onErrorContainer: Color(0xFFFFDAD6),
  background: Color(0xFF191C1E),
  onBackground: Color(0xFFE1E3E4),
  surface: Color(0xFF191C1E),
  onSurface: Color(0xFFE1E3E4),
  surfaceVariant: Color(0xFF40484C),
  onSurfaceVariant: Color(0xFFC0C8CC),
  outline: Color(0xFF8A9296),
  onInverseSurface: Color(0xFF191C1E),
  inverseSurface: Color(0xFFE1E3E4),
  inversePrimary: Color(0xFF006782),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF5ED4FF),
  outlineVariant: Color(0xFF40484C),
  scrim: Color(0xFF000000),
);

class ThemeDarkHolder implements ThemeHolder {
  final _colorGray500 = HexColor.fromHex('#828282');

  @override
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: _darkColorScheme,
      );

  @override
  ThemeOptions getThemeOptions() => ThemeOptions(
        colorGray500: _colorGray500,
      );

  @override
  String get themeId => 'dark';
}
