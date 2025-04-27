import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/Controller/splash_second_controller.dart';
import 'package:huanmaiw/MVC/Widget/language_switch.dart';
import 'package:huanmaiw/MVC/Widget/splash_buttons.dart';
import 'package:huanmaiw/MVC/Widget/splash_logo.dart';

class SplashSecondScreen extends GetView<SplashSecondController> {
  const SplashSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const LanguageSwitch(),
              ResInset.g20,
              FadeTransition(
                opacity: controller.logoFadeAnimation,
                child: const SplashLogo(),
              ),
              ResInset.g20,
              const Spacer(),
              SlideTransition(
                position: controller.buttonSlideAnimation,
                child: const SplashButtons(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
