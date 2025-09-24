import 'dart:async';

import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashController extends GetxController with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> scaleAnimation;
  late Animation<double> fadeAnimation;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();

    //Rotation controller
    animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,);

    // scale from 0 invisble  to 1 normal size
    scaleAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeOutBack)
    );

    //fade from transparent to fully visible

    fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: animationController, curve: Curves.easeIn),
    );
    animationController.forward();

    // after 4 seconds goto home screen
    Future.delayed(const Duration(seconds: 2), (){
      Get.offNamed('/home');
    });
  }
  @override
  void onClose() {
    // TODO: implement onClose

    animationController.dispose();
    super.onClose();
  }
}