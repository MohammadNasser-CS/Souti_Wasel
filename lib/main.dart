import 'package:flutter/material.dart';
import 'package:soute_wasel/core/Utils/app_color.dart';
import 'package:soute_wasel/core/Utils/routes/app_router.dart';
import 'package:soute_wasel/core/Utils/routes/app_routes.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Souti Wasel',
      debugShowCheckedModeBanner: false,

      // Application Theme
      theme: ThemeData(
        primaryColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.grey1,
        appBarTheme: const AppBarTheme(
            backgroundColor: AppColor.white, scrolledUnderElevation: 0),
        useMaterial3: true,
        inputDecorationTheme: _buildInputDecorationTheme(),
      ),

      // Initial Route
      initialRoute: AppRoutes.splash,

      // Route Generator
      onGenerateRoute: AppRouter.generateRoute,
    );
  }

  /// Builds the InputDecoration theme to keep the code cleaner and reusable.
  InputDecorationTheme _buildInputDecorationTheme() {
    return InputDecorationTheme(
      fillColor: AppColor.white,
      filled: true,
      border: _buildOutlineInputBorder(AppColor.grey4),
      enabledBorder: _buildOutlineInputBorder(AppColor.grey4),
      focusedBorder: _buildOutlineInputBorder(AppColor.grey4),
      disabledBorder: _buildOutlineInputBorder(AppColor.grey4),
      errorBorder: _buildOutlineInputBorder(AppColor.red),
      focusedErrorBorder: _buildOutlineInputBorder(AppColor.red),
    );
  }

  /// Reusable method for creating consistent border styles.
  OutlineInputBorder _buildOutlineInputBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(8.0),
      borderSide: BorderSide(color: color),
    );
  }
}
