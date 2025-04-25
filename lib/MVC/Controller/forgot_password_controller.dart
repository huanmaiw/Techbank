import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/auth_controller.dart';

class ForgotPasswordController extends GetxController {
  final emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final AuthController authController = Get.find<AuthController>();

  void sendResetEmail() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      errorMessage.value = '';

      authController
          .sendPasswordResetEmail(emailController.text.trim())
          .catchError((_) {
        errorMessage.value = 'Không thể gửi yêu cầu. Vui lòng thử lại.';
      }).whenComplete(() => isLoading.value = false);
    }
  }

  String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập email';
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return 'Email không hợp lệ';
    }
    return null;
  }

  @override
  void onClose() {
    emailController.dispose();
    super.onClose();
  }
}
