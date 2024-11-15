import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'core/constants/app/app_constants.dart';
import 'core/init/lang/language_manager.dart';
import 'core/init/notifiers/app_providers.dart';
import 'views/app/view/app_view.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  runApp(
    EasyLocalization(
      path: AppConstant.langAssetPath,
      supportedLocales: LanguageManager.instance.supoortedLocales,
      child: MultiProvider(
        providers: [
          ...AppProvider.instance.singleProviders,
        ],
        child: const AppView(),
      ),
    ),
  );
}
