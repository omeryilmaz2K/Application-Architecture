import 'package:application_architecture/core/constants/app/app_constants.dart';
import 'package:application_architecture/core/init/lang/language_manager.dart';
import 'package:application_architecture/view/example/view/example_base_view.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: AppConstant.langAssetPath,
      supportedLocales: LanguageManager.instance.supoortedLocales,
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      home: const ExampleBaseView(),
    );
  }
}
