import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../core/base/state/base_state.dart';
import '../../../core/base/view/base_view.dart';
import '../../../core/constants/enums/locale_keys_enum.dart';
import '../../../core/extensions/string_ext.dart';
import '../../../core/init/cache/locale_manager.dart';
import '../../../core/init/lang/language_manager.dart';
import '../../../core/init/lang/locale_keys.g.dart';
import '../../../core/init/network/network_manager.dart';
import '../service/example_service.dart';
import '../viewmodel/example_view_model.dart';

final class ExampleBaseView extends StatefulWidget {
  const ExampleBaseView({super.key});

  @override
  BaseState<ExampleBaseView> createState() => _ExampleBaseViewState();
}

final class _ExampleBaseViewState extends BaseState<ExampleBaseView> {
  ExampleViewModel exampleViewModel = ExampleViewModel(
    exampleService: ExampleService(
      networkManager: NetworkManager.instance,
    ),
  );

  @override
  Widget build(BuildContext context) {
    exampleViewModel.setContext(context);

    return BaseView<ExampleViewModel>(
      viewModel: exampleViewModel,
      onPageBuilder: (context, viewModel) => Observer(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              title: Text(
                LocaleManager.instance.getStringValue(
                  LocaleKeysEnum.token,
                ),
              ),
              actions: [
                IconButton(
                  onPressed: viewModel.changeTheme,
                  icon: const Icon(
                    Icons.motion_photos_on_rounded,
                  ),
                ),
                IconButton(
                  onPressed: () => context.setLocale(
                    context.locale != LanguageManager.instance.enLocale
                        ? LanguageManager.instance.enLocale
                        : LanguageManager.instance.trLocale,
                  ),
                  icon: const Icon(
                    Icons.language,
                  ),
                ),
                IconButton(
                  onPressed: () => showDialog(
                    context: context,
                    builder: (context) => FutureBuilder(
                      future: viewModel.getExampleModel(),
                      builder: (context, snap) {
                        return Dialog(
                          child: Container(
                            padding: const EdgeInsets.all(8),
                            child: Wrap(
                              children: [
                                Text('title: ${viewModel.user.title}'),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  icon: const Icon(
                    Icons.account_circle_outlined,
                  ),
                ),
              ],
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const SizedBox(),
                  Text(
                    viewModel.number.toString(),
                  ),
                  Text(viewModel.isEven
                      ? LocaleKeys.even.locale
                      : LocaleKeys.odd.locale),
                ],
              ),
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: viewModel.incrementNumber,
              child: const Icon(
                Icons.add_outlined,
              ),
            ),
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
