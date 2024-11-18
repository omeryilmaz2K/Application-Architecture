import 'package:flutter/material.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/constants/navigation/navigation_constants.dart';
import '../../../core/init/navigation/navigation_service.dart';

class ExampleView extends StatefulWidget {
  const ExampleView({super.key});

  @override
  BaseState<ExampleView> createState() => _ExampleViewState();
}

class _ExampleViewState extends BaseState<ExampleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: dynamicHeight(0.1),
          color: themeData.primaryColor,
          child: ElevatedButton(
            onPressed: () => NavigationService.instance.navigateToPage(
              path: NavigationConstant.exampleBaseView,
            ),
            child: const Text('Example Base View'),
          ),
        ),
      ),
    );
  }
}
