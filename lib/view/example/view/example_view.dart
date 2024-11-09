import 'package:application_architecture/core/base/state/base_state.dart';
import 'package:flutter/material.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  BaseState<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends BaseState<ExampleView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: dynamicHeight(0.1),
      color: themeData.primaryColor,
      child: const Placeholder(),
    );
  }
}
