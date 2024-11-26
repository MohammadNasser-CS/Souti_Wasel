import 'package:flutter/material.dart';
import 'package:soute_wasel/core/Utils/app_color.dart';
import 'dart:async';

import 'package:soute_wasel/core/Utils/routes/app_routes.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    // Navigate to the login page after 3 seconds
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, AppRoutes.loginPage);
    });

    return Scaffold(
      backgroundColor: AppColor.grey1,
      body: Stack(
        children: [
          // Logo in the center
          Center(
            child: Image.asset('assets/images/souti_wasel_logo.png'),
          ),

          // Company name at the bottom
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Text(
                '© Mohammad Naser - Eng4You',
                style: TextStyle(
                  fontSize: 16,
                  color: AppColor.grey4,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
