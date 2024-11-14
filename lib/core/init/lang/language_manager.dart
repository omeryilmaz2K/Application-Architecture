import 'package:flutter/material.dart';

final class LanguageManager {
  const LanguageManager._();

  static LanguageManager? _instance;

  static LanguageManager get instance {
    _instance ??= const LanguageManager._();

    return _instance!;
  }

  final enLocale = const Locale('en', 'US');
  final trLocale = const Locale('tr', 'TR');

  List<Locale> get supoortedLocales => [
        enLocale,
        trLocale,
      ];
}
