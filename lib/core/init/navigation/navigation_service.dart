import 'package:flutter/material.dart';

import 'i_navigation_service.dart';

class NavigationService implements INavigationService {
  NavigationService._();

  static final NavigationService _instance = NavigationService._();

  static NavigationService get instance => _instance;

  GlobalKey<NavigatorState> navigatorKey = GlobalKey();

  bool removeAllOldRoutes(Route<dynamic> route) => false;

  @override
  Future<void> navigateToPage({
    required String path,
    Object? data,
  }) async =>
      await navigatorKey.currentState?.pushNamed(
        path,
        arguments: data,
      );

  @override
  Future<void> navigateToPageClear({
    required String path,
    Object? data,
  }) async =>
      await navigatorKey.currentState?.pushNamedAndRemoveUntil(
        path,
        removeAllOldRoutes,
        arguments: data,
      );
}
