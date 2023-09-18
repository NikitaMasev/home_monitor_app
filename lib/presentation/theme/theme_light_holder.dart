import 'package:flutter/material.dart';

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFF006782),
  onPrimary: Color(0xFFFFFFFF),
  primaryContainer: Color(0xFFBBE9FF),
  onPrimaryContainer: Color(0xFF001F29),
  secondary: Color(0xFF006877),
  onSecondary: Color(0xFFFFFFFF),
  secondaryContainer: Color(0xFFA5EEFF),
  onSecondaryContainer: Color(0xFF001F25),
  tertiary: Color(0xFF466811),
  onTertiary: Color(0xFFFFFFFF),
  tertiaryContainer: Color(0xFFC6F08A),
  onTertiaryContainer: Color(0xFF112000),
  error: Color(0xFFBA1A1A),
  errorContainer: Color(0xFFFFDAD6),
  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410002),
  background: Color(0xFFFBFCFE),
  onBackground: Color(0xFF191C1E),
  surface: Color(0xFFFBFCFE),
  onSurface: Color(0xFF191C1E),
  surfaceVariant: Color(0xFFDCE4E8),
  onSurfaceVariant: Color(0xFF40484C),
  outline: Color(0xFF70787D),
  onInverseSurface: Color(0xFFEFF1F3),
  inverseSurface: Color(0xFF2E3132),
  inversePrimary: Color(0xFF5ED4FF),
  shadow: Color(0xFF000000),
  surfaceTint: Color(0xFF006782),
  outlineVariant: Color(0xFFC0C8CC),
  scrim: Color(0xFF000000),
);

class ThemeLightHolder {
  ThemeData getTheme() => ThemeData(
        useMaterial3: true,
        brightness: Brightness.light,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        colorScheme: _lightColorScheme,
        splashColor: _lightColorScheme.tertiaryContainer,
        cardTheme: CardTheme(
          clipBehavior: Clip.hardEdge,
          color: _lightColorScheme.surfaceVariant,
          elevation: 0,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(12),
            ),
          ),
        ),
      );
}
