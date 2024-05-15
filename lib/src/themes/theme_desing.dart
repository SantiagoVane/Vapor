import 'package:flutter/material.dart';

class ThemeDesing {
  ThemeDesing();
  ThemeData themeApp() {
    return ThemeData(
      useMaterial3: true,
      colorSchemeSeed: Colors.indigo,
      brightness: Brightness.light,
    );
  }
}
