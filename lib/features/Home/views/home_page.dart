import 'package:flutter/material.dart';
import 'package:soute_wasel/features/Home/views/widgets/home_page_header.dart';
import 'package:soute_wasel/features/Home/views/widgets/letters_section.dart';
import 'package:soute_wasel/core/models/user_model.dart';

class UserHomePage extends StatefulWidget {
  final UserModel user;
  const UserHomePage({super.key, required this.user});

  @override
  State<UserHomePage> createState() => _UserHomePageState();
}

class _UserHomePageState extends State<UserHomePage> {
  @override
  Widget build(BuildContext context) {
    debugPrint(widget.user.toString());
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 16.0,
        vertical: 8.0,
      ),
      child: Column(
        children: [
          HomePageHeader(),
          SizedBox(height: 8.0),
          SizedBox(height: 8.0),
          Expanded(child: LettersSection()),
        ],
      ),
    );
  }
}
