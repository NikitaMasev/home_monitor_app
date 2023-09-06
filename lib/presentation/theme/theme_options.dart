import 'package:flutter/material.dart';
import 'package:theme_provider/theme_provider.dart';

class ThemeOptions implements AppThemeOptions {
  ThemeOptions({required this.colorGray500});

  final Color colorGray500;
}
