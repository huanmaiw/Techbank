import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/auth_service.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  var isLoading = false.obs;
  var rememberMe = false.obs;

  void login() async {
    if (!formKey.currentState!.validate()) return;

    isLoading.value = true;
    await AuthService.signInWithEmail(
      emailController.text.trim(),
      passwordController.text.trim(),
    );
    isLoading.value = false;
  }
}
