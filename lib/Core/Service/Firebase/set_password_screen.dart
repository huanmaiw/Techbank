// lib/views/set_password_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/set_password_controller.dart';

class SetPasswordScreen extends StatelessWidget {
  const SetPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // GetX controller
    final SetPasswordController controller = Get.put(SetPasswordController());

    return Scaffold(
      appBar: AppBar(title: const Text('Set Password')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
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
            ElevatedButton(
              onPressed: controller.setPassword,
              child: const Text('Set Password'),
            ),
          ],
        ),
      ),
    );
  }
}
