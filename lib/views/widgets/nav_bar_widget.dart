import 'package:book_app/views/screens/user/customer_home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../logic/controllers/nav_bar_controller.dart';
import '../screens/setting/profile.dart';
import '../screens/setting/settings_screen.dart';

class NavBarScreen extends StatelessWidget {
   NavBarScreen({super.key});

  final List<Map<String, dynamic>> _pages =  [
    {'title': 'Home', 'screen': CustomerHome()},
    {'title': 'Profile', 'screen': ProfileScreen()},
    {'title': 'Trending', 'screen': ProfileScreen()},
    {'title': 'Settings', 'screen': SettingScreen()},
  ];

  final controller = Get.find<NavBarController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<NavBarController>(
        builder: (_) {
          return Scaffold(
            body: _pages[controller.currentIndex]['screen'],
            bottomNavigationBar: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: controller.currentIndex,
              onTap: controller.selectedPage,
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.person),
                  label: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.local_fire_department_rounded),
                  label: 'Trending',
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings',
                ),
              ],
            ),
          );
        });
  }
}
