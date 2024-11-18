import 'package:flutter/material.dart';

import '../../../views/example/view/example_base_view.dart';
import '../../constants/navigation/navigation_constants.dart';
import '../components/cards/not_found_card_widget.dart';

class NavigationRoute {
  NavigationRoute._();

  static final NavigationRoute _instance = NavigationRoute._();

  static NavigationRoute get instance => _instance;

  Route<dynamic>? generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case NavigationConstant.exampleBaseView:
        return defaultNavigate(const ExampleBaseView());
      default:
        return defaultNavigate(const NotFoundCardWidget());
    }
  }

  MaterialPageRoute defaultNavigate(Widget view) {
    return MaterialPageRoute(
      builder: (context) => view,
    );
  }
}
