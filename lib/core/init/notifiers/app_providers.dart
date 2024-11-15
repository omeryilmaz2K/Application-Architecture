import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'theme_notifier.dart';

final class AppProvider {
  AppProvider._();

  static AppProvider? _instance;

  static AppProvider get instance {
    _instance ??= AppProvider._();

    return _instance!;
  }

  List<SingleChildWidget> singleProviders = [
    ChangeNotifierProvider<ThemeNotifier>(
      create: (context) => ThemeNotifier(),
    ),
  ];

  List<SingleChildWidget> dependedProviders = [
    // ProxyProvider(update: update),
    // StreamProvider(create: create, initialData: initialData),
  ];

  List<SingleChildWidget> uiProviders = [];
}