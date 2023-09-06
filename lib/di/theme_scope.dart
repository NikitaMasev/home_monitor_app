import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:home_monitor/presentation/theme/theme_factory.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeScope extends StatelessWidget {
  const ThemeScope({required this.child});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    final themeLight = ThemeFactory.createLightTheme();
    final themeDark = ThemeFactory.createDarkTheme();
    return ThemeProvider(
      defaultThemeId: themeLight.themeId,
      themes: [
        AppTheme(
          id: themeLight.themeId,
          data: themeLight.getTheme(),
          options: themeLight.getThemeOptions(),
          description: themeLight.themeId,
        ),
        AppTheme(
          id: themeDark.themeId,
          data: themeDark.getTheme(),
          options: themeDark.getThemeOptions(),
          description: themeDark.themeId,
        ),
      ],
      onInitCallback: (final controller, final previouslySaved) {
        final platformBrightness =
            SchedulerBinding.instance.window.platformBrightness;
        if (platformBrightness == Brightness.dark) {
          controller.setTheme(themeDark.themeId);
        } else {
          controller.setTheme(themeLight.themeId);
        }
      },
      child: child,
    );
  }
}

/*  controller.setTheme('light');
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Color(0xFFFFFFFF),
      systemNavigationBarIconBrightness: Brightness.dark,
    ),
  );*/
