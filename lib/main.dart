import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:qaza_namaz/theme.dart';
import 'controllers/theme_controller.dart';
import 'views/bottom_navi_view.dart';
import 'views/splash_screen/splash_screen_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();

  // Put controller in memory
  Get.put(ThemeController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeController = Get.find<ThemeController>();

    return Obx(() => GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: themeController.currentTheme,
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: () => SplashScreenView()),
        GetPage(
          name: '/home',
          page: () => BottomNaviView(),
          transition: Transition.rightToLeftWithFade,
          transitionDuration: const Duration(milliseconds: 800),
        ),
      ],
    ));
  }
}



