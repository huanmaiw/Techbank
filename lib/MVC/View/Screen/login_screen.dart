import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/MVC/Controller/login_controller.dart';

class LoginScreen extends StatelessWidget {
  final controller = Get.put(LoginController());

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
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
              const SizedBox(height: 24),
              // Obx(() =>
              //     ElevatedButton(
              //     onPressed: ()=>
              //       Get.offAll(Routers.home),
              //  // onPressed: controller.isLoading.value ? null : controller.login,
              //   child: controller.isLoading.value
              //       ? const CircularProgressIndicator(color: Colors.white)
              //       : const Text('Login'),
              // ),
              ElevatedButton(
                onPressed: () {
                  Get.offAllNamed(Routers.homelogin);
                },
                child: const Text('Login'),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => Get.offNamed(Routers.register),
                child: const Text("Don't have an account? Register"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
