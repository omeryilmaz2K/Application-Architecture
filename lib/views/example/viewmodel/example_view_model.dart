// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/constants/enums/app_themes.dart';
import '../../../core/init/notifiers/theme_notifier.dart';

part 'example_view_model.g.dart';

final class ExampleViewModel = _ExampleViewModel with _$ExampleViewModel;

abstract class _ExampleViewModel with Store {
  late BuildContext viewContext;

  void setContext(BuildContext context) {
    viewContext = context;
  }

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }

  void changeTheme() {
    final currentAppTheme =
        Provider.of<ThemeNotifier>(viewContext, listen: false).currentAppTheme;

    Provider.of<ThemeNotifier>(viewContext, listen: false).changeTheme(
      currentAppTheme != AppThemes.light ? AppThemes.light : AppThemes.dark,
    );
  }
}
