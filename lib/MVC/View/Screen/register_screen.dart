import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/Controller/register_controller.dart';

class RegisterScreen extends StatelessWidget {
  final controller = Get.put(RegisterController());

  RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: controller.emailController,
              decoration: const InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.passwordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: controller.confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(
                labelText: 'Confirm Password',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 24),
            Obx(() => Column(
              children: [
                ElevatedButton(
                  onPressed: controller.isLoading.value ? null : controller.register,
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator(color: Colors.white)
                      : const Text('Register'),
                ),
                ResInset.g8,
                TextButton(
                  onPressed: () {
                    Get.offNamed(Routers.login); // Hoặc: Get.toNamed() nếu muốn giữ stack
                  },
                  child: const Text('Already have an account? Login'),
                ),

              ],
            )),
          ],
        ),
      ),
    );
  }
}
