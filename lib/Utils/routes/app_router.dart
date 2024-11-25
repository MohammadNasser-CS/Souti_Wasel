import 'package:flutter/material.dart';
import 'package:soute_wasel/Utils/routes/app_routes.dart';
import 'package:soute_wasel/Views/bottom_navbar/custom_bottom_navbar.dart';
import 'package:soute_wasel/models/user_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.home:
        return MaterialPageRoute(
          builder: (_) => CustomBottomNavbar(user: dummyUsers[0]),
          settings: settings,
        );
      default:
        return MaterialPageRoute(
          builder: (_) => CustomBottomNavbar(user: dummyUsers[0]),
          settings: settings,
        );
    }
  }
}
