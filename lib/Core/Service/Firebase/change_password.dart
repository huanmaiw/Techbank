import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'auth_controller.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller AuthController
    final AuthController authController = Get.put(AuthController());
    final currentPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(title: const Text('Đổi mật khẩu')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              // Trường nhập mật khẩu cũ
              TextFormField(
                controller: currentPasswordController,
                decoration: const InputDecoration(labelText: 'Mật khẩu hiện tại'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu hiện tại';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Trường nhập mật khẩu mới
              TextFormField(
                controller: newPasswordController,
                decoration: const InputDecoration(labelText: 'Mật khẩu mới'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu mới';
                  }
                  if (value.length < 6) {
                    return 'Mật khẩu mới phải có ít nhất 6 ký tự';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Nút đổi mật khẩu
              Obx(() {
                return authController.isLoading.value
                    ? const CircularProgressIndicator()  // Hiển thị progress khi đang xử lý
                    : ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() ?? false) {
                      // Gọi hàm đổi mật khẩu trong AuthController
                      authController.changePassword(
                        currentPasswordController.text.trim(),
                        newPasswordController.text.trim(),
                      );
                    }
                  },
                  child: const Text('Đổi mật khẩu'),
                );
              }),

              const SizedBox(height: 20),

              // Hiển thị thông báo lỗi nếu có
              Obx(() {
                return Text(
                  authController.errorMessage.value,
                  style: const TextStyle(color: Colors.red),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
