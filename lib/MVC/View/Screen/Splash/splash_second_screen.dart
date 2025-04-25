import 'package:flutter/material.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/Widget/language_switch.dart';
import 'package:huanmaiw/MVC/Widget/splash_buttons.dart';
import 'package:huanmaiw/MVC/Widget/splash_logo.dart';

class SplashSecondScreen extends StatelessWidget {
  const SplashSecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Padding(
          padding:  EdgeInsets.all(8.0),
          child: Column(
            children: [
               LanguageSwitch(),
              ResInset.g20,
               SplashLogo(),
              ResInset.g20,
               Spacer(),
               SplashButtons(),
            ],
          ),
        ),
      ),
    );
  }
}
