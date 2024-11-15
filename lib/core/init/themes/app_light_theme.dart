import 'package:flutter/material.dart';

import 'app_theme.dart';

final class AppLightTheme implements AppTheme {
  const AppLightTheme._();

  static AppLightTheme? _instance;

  static AppLightTheme get instance {
    _instance ??= const AppLightTheme._();

    return _instance!;
  }

  @override
  ThemeData get theme => ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.white,
      );
}
