// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

import '../../../core/base/viewmodel/base_view_model.dart';
import '../../../core/constants/enums/app_themes.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/notifiers/theme_notifier.dart';
import '../model/example_model.dart';
import '../service/example_service.dart';

part 'example_view_model.g.dart';

final class ExampleViewModel = _ExampleViewModel with _$ExampleViewModel;

abstract class _ExampleViewModel extends BaseViewModel with Store {
  _ExampleViewModel({required this.exampleService});

  final ExampleService exampleService;

  @override
  void init() {}

  @override
  void setContext(BuildContext context) => viewContext = context;

  @observable
  ExampleModel user = ExampleModel();

  @observable
  bool isLoading = false;

  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;

    LocaleManager.instance.setString(LocaleKeysEnum.token, number.toString());
  }

  void changeTheme() {
    final currentAppTheme =
        Provider.of<ThemeNotifier>(viewContext, listen: false).currentAppTheme;

    Provider.of<ThemeNotifier>(viewContext, listen: false).changeTheme(
      currentAppTheme != AppThemes.light ? AppThemes.light : AppThemes.dark,
    );
  }

  @action
  Future<void> getExampleModel() async {
    isLoading = !isLoading;

    final model = await exampleService.getExampleRequest(user);

    user = model;

    isLoading = !isLoading;
  }
}
