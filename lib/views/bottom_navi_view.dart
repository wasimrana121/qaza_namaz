import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaza_namaz/controllers/bottom_nav_controller.dart';
import 'package:qaza_namaz/views/qaza_namaz_screen.dart';
import 'package:qaza_namaz/views/setting_page.dart';
import 'package:qaza_namaz/views/stat_page.dart';


class BottomNaviView extends StatelessWidget {
  BottomNaviView({super.key});
  final BottomNavController navController=Get.put(BottomNavController());
  final List<Widget> pages=[
    HomePage(),
    StatsPage(),
    SettingsPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Obx(
      ()=> Scaffold(
        body: pages[navController.currentIndex.value],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: navController.currentIndex.value,
            onTap: navController.changeTab,
            items: [
          BottomNavigationBarItem(icon: Icon(Icons.home),label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: "Stat"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting")
        ]),
      ),
    );
  }
}
