import 'package:flutter/material.dart';
import 'package:logistics_now/core/utils/routes/routes.dart';
import 'package:logistics_now/presentation/screens/home_screen.dart';
import 'package:logistics_now/presentation/screens/login_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final String? routeName = settings.name;

    final Widget widget;
    switch (routeName) {
      case Routes.LOGIN:
        widget = const LoginScreen();
        break;

      case Routes.HOME:
        widget = const HomeScreen();
        break;

      default:
        widget = const SizedBox();
        break;
    }

    return MaterialPageRoute(
      builder: (_) => widget,
      settings: RouteSettings(name: routeName),
    );
  }
}
