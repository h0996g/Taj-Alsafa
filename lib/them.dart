import 'package:flutter/material.dart';
import 'package:taj_alsafa/const/colors.dart';

class AppThemes {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    scaffoldBackgroundColor: Colors.white,
    textSelectionTheme: TextSelectionThemeData(
      cursorColor: primaryColor,
      selectionColor: primaryColor.withOpacity(0.3),
      selectionHandleColor: primaryColor,
    ),
    brightness: Brightness.light,
    primaryColor: primaryColor,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        splashFactory: NoSplash.splashFactory,
        overlayColor: Colors.transparent,
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,

    brightness: Brightness.dark,
    primaryColor: primaryColor,
  );
}
