import 'package:shared_preferences/shared_preferences.dart';

import '../../constants/enums/locale_keys_enum.dart';

class LocaleManager {
  LocaleManager._();

  static final LocaleManager _instance = LocaleManager._();

  static LocaleManager get instance => _instance;

  SharedPreferences? _preferences;

  LocaleManager._init() {
    SharedPreferences.getInstance().then(
      (value) => _preferences = value,
    );
  }

  static preferencesInit() async {
    instance._preferences ??= await SharedPreferences.getInstance();

    return;
  }

  Future<void> setString(LocaleKeysEnum key, String value) async {
    await _preferences?.setString(key.toString(), value);
  }

  String getStringValue(LocaleKeysEnum key) {
    return _preferences?.getString(key.toString()) ?? '';
  }
}
