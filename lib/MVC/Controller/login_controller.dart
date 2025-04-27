import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/Core/Service/Firebase/auth_service.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';

class LoginController extends GetxController {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final isLoading = false.obs;
  final errorMessage = ''.obs;
  final rememberMe = false.obs;
  var isPasswordVisible = false.obs;

  Future<void> signInWithEmail(String email, String password) async {
    if (email.isEmpty || password.isEmpty) {
      SnackbarHelper.showError('Lỗi', 'Vui lòng nhập email và mật khẩu');
      return;
    }

    if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email)) {
      SnackbarHelper.showError('Lỗi', 'Email không hợp lệ');
      return;
    }

    isLoading.value = true;
    try {
      await AuthService.signInWithEmail(email, password);
      Get.offAllNamed(Routers.home);
      SnackbarHelper.showSuccess('Thành công', 'Đăng nhập thành công');
    } catch (e) {
      // Hiển thị thông báo lỗi
      SnackbarHelper.showError('Đăng nhập thất bại', e.toString().replaceFirst('Exception: ', ''));
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}