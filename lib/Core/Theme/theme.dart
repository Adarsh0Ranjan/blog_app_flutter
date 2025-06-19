import 'package:blog_app_flutter/Core/Theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final  darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
  );
}