// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExampleViewModel on _ExampleViewModel, Store {
  Computed<bool>? _$isEvenComputed;

  @override
  bool get isEven => (_$isEvenComputed ??=
          Computed<bool>(() => super.isEven, name: '_ExampleViewModel.isEven'))
      .value;

  late final _$userAtom =
      Atom(name: '_ExampleViewModel.user', context: context);

  @override
  ExampleModel get user {
    _$userAtom.reportRead();
    return super.user;
  }

  @override
  set user(ExampleModel value) {
    _$userAtom.reportWrite(value, super.user, () {
      super.user = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: '_ExampleViewModel.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$numberAtom =
      Atom(name: '_ExampleViewModel.number', context: context);

  @override
  int get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(int value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$getExampleModelAsyncAction =
      AsyncAction('_ExampleViewModel.getExampleModel', context: context);

  @override
  Future<void> getExampleModel() {
    return _$getExampleModelAsyncAction.run(() => super.getExampleModel());
  }

  late final _$_ExampleViewModelActionController =
      ActionController(name: '_ExampleViewModel', context: context);

  @override
  void incrementNumber() {
    final _$actionInfo = _$_ExampleViewModelActionController.startAction(
        name: '_ExampleViewModel.incrementNumber');
    try {
      return super.incrementNumber();
    } finally {
      _$_ExampleViewModelActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
user: ${user},
isLoading: ${isLoading},
number: ${number},
isEven: ${isEven}
    ''';
  }
}
