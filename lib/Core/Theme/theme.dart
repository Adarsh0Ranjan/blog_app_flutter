import 'package:blog_app_flutter/Core/Theme/app_pallete.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static  _border({Color color = AppPallete.borderColor}) => OutlineInputBorder(
    borderSide: BorderSide(color: color, width: 3),
    borderRadius: BorderRadius.circular(10),
  );
  static final darkThemeMode = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: AppPallete.backgroundColor,
    appBarTheme: AppBarTheme(
      backgroundColor: AppPallete.backgroundColor
    ),
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: EdgeInsets.all(27),
      enabledBorder: _border(),
      focusedBorder: _border(color: AppPallete.gradient2)
    ),
  );
}
