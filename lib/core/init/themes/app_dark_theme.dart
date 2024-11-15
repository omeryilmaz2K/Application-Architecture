import 'package:flutter/material.dart';

import 'app_theme.dart';

final class AppDarkTheme implements AppTheme {
  const AppDarkTheme._();

  static AppDarkTheme? _instance;

  static AppDarkTheme get instance {
    _instance ??= const AppDarkTheme._();

    return _instance!;
  }

  @override
  ThemeData get theme => ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.black,
      );
}
