// ignore_for_file: library_private_types_in_public_api

import 'package:mobx/mobx.dart';

part 'example_view_model.g.dart';

final class ExampleViewModel = _ExampleViewModel with _$ExampleViewModel;

abstract class _ExampleViewModel with Store {
  @observable
  int number = 0;

  @computed
  bool get isEven => number % 2 == 0;

  @action
  void incrementNumber() {
    number++;
  }
}
