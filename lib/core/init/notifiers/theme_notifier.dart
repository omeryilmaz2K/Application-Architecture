import 'package:flutter/material.dart';

import '../../constants/enums/app_themes.dart';
import '../themes/app_light_theme.dart';

final class ThemeNotifier extends ChangeNotifier {
  ThemeData _currentTheme = AppLightTheme.instance.theme;

  ThemeData get currentTheme => _currentTheme;

  AppThemes currentAppTheme = AppThemes.light;

  void changeTheme(AppThemes themes) {
    switch (themes) {
      case AppThemes.light:
        _currentTheme = ThemeData.light();
        currentAppTheme = AppThemes.light;
      case AppThemes.dark:
        _currentTheme = ThemeData.dark();
        currentAppTheme = AppThemes.dark;
    }

    notifyListeners();
  }
}
