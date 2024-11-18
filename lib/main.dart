import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/cache/locale_manager.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/notifiers/app_providers.dart';
import 'views/app/view/app_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  await LocaleManager.preferencesInit();

  runApp(
    MultiProvider(
      providers: [
        ...AppProvider.instance.singleProviders,
      ],
      child: EasyLocalization(
        path: AppConstant.langAssetPath,
        supportedLocales: LanguageManager.instance.supoortedLocales,
        child: const AppView(),
      ),
    ),
  );
}
