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
      theme: ThemeData(
        primaryColor: AppColor.white,
        scaffoldBackgroundColor: AppColor.grey1,
        appBarTheme: const AppBarTheme(backgroundColor: AppColor.white),
        useMaterial3: true,
        inputDecorationTheme: InputDecorationTheme(
          fillColor: AppColor.white,
          filled: true,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColor.grey4),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColor.grey4),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColor.grey4),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: BorderSide(color: AppColor.grey4),
          ),
          errorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColor.red),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8.0),
            borderSide: const BorderSide(color: AppColor.red),
          ),
        ),
      ),
      initialRoute: AppRoutes.loginPage,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
