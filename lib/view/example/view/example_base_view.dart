import 'package:application_architecture/core/base/state/base_state.dart';
import 'package:application_architecture/core/base/view/base_view.dart';
import 'package:flutter/material.dart';

class ExampleBaseView extends StatefulWidget {
  const ExampleBaseView({super.key});

  @override
  BaseState<ExampleBaseView> createState() => _ExampleBaseViewState();
}

class _ExampleBaseViewState extends BaseState<ExampleBaseView> {
  @override
  Widget build(BuildContext context) {
    return BaseView(
      viewModel: '',
      onPageBuilder: (context, viewModel) => const Text(''),
      onModelReady: (model) {},
      onDispose: () {},
    );
  }
}
