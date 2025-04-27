import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashSecondController extends GetxController with GetTickerProviderStateMixin {
  late AnimationController logoAnimationController;
  late AnimationController buttonAnimationController;

  late Animation<double> logoFadeAnimation;
  late Animation<Offset> buttonSlideAnimation;

  @override
  void onInit() {
    super.onInit();

    logoAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1500),
    );

    buttonAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    logoFadeAnimation = Tween<double>(
      begin: 0,
      end: 1,
    ).animate(CurvedAnimation(
      parent: logoAnimationController,
      curve: Curves.easeIn,
    ));

    buttonSlideAnimation = Tween<Offset>(
      begin: const Offset(0, 1),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: buttonAnimationController,
      curve: Curves.easeOut,
    ));

    logoAnimationController.forward();
    Future.delayed(const Duration(milliseconds: 500), () {
      buttonAnimationController.forward();
    });
  }

  @override
  void onClose() {
    logoAnimationController.dispose();
    buttonAnimationController.dispose();
    super.onClose();
  }
}
