import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/auth_controller.dart';

class ChangePasswordController extends GetxController {
  final currentPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  final isLoading = false.obs;
  final errorMessage = ''.obs;

  final AuthController authController = Get.find<AuthController>();

  void onChangePasswordPressed() {
    if (formKey.currentState?.validate() ?? false) {
      isLoading.value = true;
      errorMessage.value = '';

      authController
          .changePassword(
        currentPasswordController.text.trim(),
        newPasswordController.text.trim(),
      )
          .catchError((e) {
        errorMessage.value = 'Đổi mật khẩu thất bại';
      })
          .whenComplete(() => isLoading.value = false);
    }
  }

  String? validateCurrentPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu hiện tại';
    }
    return null;
  }

  String? validateNewPassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Vui lòng nhập mật khẩu mới';
    }
    if (value.length < 6) {
      return 'Mật khẩu mới phải có ít nhất 6 ký tự';
    }
    return null;
  }

  @override
  void onClose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    super.onClose();
  }
}
