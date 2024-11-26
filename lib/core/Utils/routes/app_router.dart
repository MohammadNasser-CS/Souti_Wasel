import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:soute_wasel/core/Utils/routes/app_routes.dart';
import 'package:soute_wasel/features/auth/login/views/login_page.dart';
import 'package:soute_wasel/features/auth/manager/auth_cubit.dart';
import 'package:soute_wasel/features/auth/register/views/register.dart';
import 'package:soute_wasel/features/bottom_navbar/views/custom_bottom_navbar.dart';
import 'package:soute_wasel/core/models/user_model.dart';
import 'package:soute_wasel/features/splash/splash_screen.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
          settings: settings,
        );
        case AppRoutes.registerPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const RegisterPage(),
          ),
          settings: settings,
        );
      case AppRoutes.loginPage:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: const LoginPage(),
          ),
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
