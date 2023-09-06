import 'package:flutter/material.dart';
import 'package:home_monitor/presentation/theme/hex_color_converter.dart';
import 'package:home_monitor/presentation/theme/theme_holder.dart';
import 'package:home_monitor/presentation/theme/theme_options.dart';

class ThemeDarkHolder implements ThemeHolder {
  final _colorPrimary = HexColor.fromHex('#47A76A');
  final _colorBackground = Colors.white;
  final _colorGray500 = HexColor.fromHex('#828282');

  @override
  ThemeData getTheme() => ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        scaffoldBackgroundColor: _colorBackground,
        backgroundColor: _colorBackground,
        primaryColor: _colorPrimary,
      );

  @override
  ThemeOptions getThemeOptions() => ThemeOptions(
        colorGray500: _colorGray500,
      );

  @override
  String get themeId => 'dark';
}
