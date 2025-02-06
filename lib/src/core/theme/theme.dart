import 'package:flutter/material.dart';

class GoTheme {
  GoTheme._();

  static ThemeData get theme => ThemeData(
        colorScheme: ColorScheme.light(
          primary: Colors.red,
          onPrimary: Colors.white,
        ),
        appBarTheme: _appBarTheme(),
      );

  static AppBarTheme _appBarTheme() {
    return AppBarTheme(
      color: Colors.red,
      foregroundColor: Colors.white,
      toolbarHeight: 80,
      titleSpacing: 0,
    );
  }
}
