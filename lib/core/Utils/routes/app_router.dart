import 'package:flutter/material.dart';
import 'package:soute_wasel/core/Utils/routes/app_routes.dart';
import 'package:soute_wasel/features/auth/login/views/login_page.dart';
import 'package:soute_wasel/features/bottom_navbar/views/custom_bottom_navbar.dart';
import 'package:soute_wasel/core/models/user_model.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
       case AppRoutes.loginPage:
        return MaterialPageRoute(
          builder: (_) => const LoginPage(),
          settings: settings,
        );
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
