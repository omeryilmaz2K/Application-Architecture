import 'package:flutter/material.dart';

abstract class BaseViewModel {
  late BuildContext viewContext;

  void setContext(BuildContext viewContext);

  void init();
}
