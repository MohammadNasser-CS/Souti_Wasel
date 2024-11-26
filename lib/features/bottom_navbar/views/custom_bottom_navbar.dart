import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:soute_wasel/core/Utils/app_color.dart';
import 'package:soute_wasel/features/Home/views/home_page.dart';
import 'package:soute_wasel/features/Profile/views/profile_page.dart';
import 'package:soute_wasel/features/bottom_navbar/views/widgets/app_bar_title_for_user.dart';
import 'package:soute_wasel/core/models/user_model.dart';

class CustomBottomNavbar extends StatefulWidget {
  final UserModel user;
  const CustomBottomNavbar({super.key, required this.user});

  @override
  State<CustomBottomNavbar> createState() => _CustomBottomNavbarState();
}

class _CustomBottomNavbarState extends State<CustomBottomNavbar> {
  late final PersistentTabController _controller;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController();
    _controller.addListener(() {
      // Use WidgetsBinding to schedule setState safely after the frame is built
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (_controller.index != currentIndex) {
          setState(() {
            currentIndex = _controller.index;
          });
        }
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<PersistentTabConfig> _buildUserScreens() {
    return [
      PersistentTabConfig(
        screen: UserHomePage(user: widget.user),
        item: ItemConfig(
          icon: const Icon(Icons.home_outlined),
          title: "الرئيسية",
          activeForegroundColor: AppColor.blue,
          inactiveForegroundColor: AppColor.grey,
        ),
      ),
      // PersistentTabConfig(
      //   screen: const FavoritePage(),
      //   item: ItemConfig(
      //     icon: const Icon(Icons.favorite_border),
      //     title: "المفضلة",
      //     activeForegroundColor: AppColor.blue,
      //     inactiveForegroundColor: AppColor.grey,
      //   ),
      // ),
      PersistentTabConfig(
        screen: const ProfilePage(),
        item: ItemConfig(
          icon: const Icon(Icons.person_outline),
          title: "حسابي",
          activeForegroundColor: AppColor.blue,
          inactiveForegroundColor: AppColor.grey,
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: size.height * 0.1,
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        leading: ClipRRect(
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: Image.asset(
              'assets/images/souti_wasel_logo.png',
              fit: BoxFit.contain,
            ),
          ),
        ),
        title: AppBarTitleForUser(index: _controller.index),
      ),
      body: PersistentTabView(
        margin: EdgeInsets.only(top: size.height * 0.02),
        backgroundColor: Theme.of(context).primaryColor,
        controller: _controller,
        navBarBuilder: (navBarConfig) => Style6BottomNavBar(
          navBarConfig: navBarConfig,
          navBarDecoration:
              NavBarDecoration(color: Theme.of(context).primaryColor),
        ),
        tabs: _buildUserScreens(),
        screenTransitionAnimation: const ScreenTransitionAnimation(
          // Screen transition animation on change of selected tab.
          curve: Curves.ease,
          duration: Duration(milliseconds: 400),
        ),
        onTabChanged: (value) {},
        stateManagement: true,
      ),
    );
  }
}
