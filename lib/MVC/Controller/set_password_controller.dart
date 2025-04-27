// lib/controllers/set_password_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SetPasswordController extends GetxController {
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  void setPassword() async {
    if (passwordController.text.trim() != confirmPasswordController.text.trim()) {
      Get.snackbar('Error', 'Passwords do not match');
      return;
    }

    try {
      User? user = _auth.currentUser;
      if (user != null) {
        await user.updatePassword(passwordController.text.trim());
        Get.snackbar('Success', 'Password has been set');
        Get.offAllNamed('/home'); // Chuyển đến màn hình chính
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}
