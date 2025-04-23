import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Get.offAllNamed(Routers.splashSecond);
    });
  }
  // @override
  // void initState() {
  //   super.initState();
  //   Future.delayed(const Duration(seconds: 2), () {
  //     final user = FirebaseAuth.instance.currentUser;
  //     if (user != null) {
  //       Get.offAllNamed(Routers.home); // Đã login
  //     } else {
  //       Get.offAllNamed(Routers.login); // Chưa login
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: _SplashContent(),
      ),
    );
  }
}
class _SplashContent extends StatelessWidget {
  const _SplashContent();
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/logo/splash.png',
          width: 150,
          height: 150,
        ),
        const SizedBox(height: 20),
        const CircularProgressIndicator(),
      ],
    );
  }
}