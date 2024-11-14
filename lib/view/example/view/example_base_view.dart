import 'package:application_architecture/core/base/state/base_state.dart';
import 'package:application_architecture/core/base/view/base_view.dart';
import 'package:application_architecture/core/extensions/string_ext.dart';
import 'package:application_architecture/core/init/lang/language_manager.dart';
import 'package:application_architecture/core/init/lang/locale_keys.g.dart';
import 'package:application_architecture/view/example/viewmodel/example_view_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

final class ExampleBaseView extends StatefulWidget {
  const ExampleBaseView({super.key});

  @override
  BaseState<ExampleBaseView> createState() => _ExampleBaseViewState();
}

final class _ExampleBaseViewState extends BaseState<ExampleBaseView> {
  ExampleViewModel exampleViewModel = ExampleViewModel();

  @override
  Widget build(BuildContext context) {
    return BaseView<ExampleViewModel>(
      viewModel: exampleViewModel,
      onPageBuilder: (context, viewModel) => Observer(
        builder: (context) {
          return CounterWidget(
            onPressed: viewModel.incrementNumber,
            number: viewModel.number,
            isEven: viewModel.isEven,
          );
        },
      ),
      onModelReady: (model) {
        exampleViewModel = model;
      },
      onDispose: () {},
    );
  }
}

final class CounterWidget extends StatelessWidget {
  const CounterWidget({
    super.key,
    required this.onPressed,
    required this.number,
    required this.isEven,
  });

  final VoidCallback onPressed;
  final int number;
  final bool isEven;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () => context.setLocale(
              context.locale != LanguageManager.instance.enLocale
                  ? LanguageManager.instance.enLocale
                  : LanguageManager.instance.trLocale,
            ),
            icon: const Icon(
              Icons.language,
            ),
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(),
            Text(
              number.toString(),
            ),
            Text(isEven ? LocaleKeys.even.locale : LocaleKeys.odd.locale),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onPressed,
        child: const Icon(
          Icons.add_outlined,
        ),
      ),
    );
  }
}
