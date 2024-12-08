import 'package:easy_localization/easy_localization.dart';

import '../constants/app/app_constants.dart';

extension StringExt on String {
  String get locale => this.tr();

  String? get isValidEmail =>
      contains(RegExp(AppConstant.emailRegex)) ? null : 'Email does not valid';
}
