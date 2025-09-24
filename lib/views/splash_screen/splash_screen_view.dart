import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qaza_namaz/views/splash_screen/splash_controller.dart';

class SplashScreenView extends StatelessWidget {
  final controller = Get.put(SplashController());
  SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:  Colors.white,
      body: Center(
        child: FadeTransition(
            opacity: controller.fadeAnimation,
          child: ScaleTransition(scale: controller.scaleAnimation,
          child: Image.asset("assets/logo/logo.png", width: 200,),)
        ),
      ),
    );
  }
}
