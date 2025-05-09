import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/MVC/Controller/set_password_controller.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SetPasswordController controller = Get.put(SetPasswordController());

    return Scaffold(
      backgroundColor: ResColor.theme,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                controller: controller.passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Mật khẩu',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: controller.confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Xác nhận mật khẩu',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: ResColor.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                onPressed: controller.setPassword,
                child: const Text('Xác nhận',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
