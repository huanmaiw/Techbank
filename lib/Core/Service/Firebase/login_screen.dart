import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/login_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'auth_controller.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final authController = Get.put(AuthController());
  final loginController = Get.put(LoginController());
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    _loadSavedCredentials();
  }

  Future<void> _loadSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    loginController.emailController.text = prefs.getString('email') ?? '';
    loginController.passwordController.text = prefs.getString('password') ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              const SizedBox(height: 30),
              Image.asset("assets/logo/splash.png", width: 150, height: 150),
              const SizedBox(height: 10),
              const Text(
                "Đăng nhập",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 30),

              // Email
              TextFormField(
                controller: loginController.emailController,
                decoration: InputDecoration(
                  labelText: 'Email',
                  prefixIcon: const Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập email';
                  }
                  if (!RegExp(r'^[\w-.]+@([\w-]+\.)+[\w-]{2,4}$')
                      .hasMatch(value)) {
                    return 'Email không hợp lệ';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 20),

              // Password
              TextFormField(
                controller: loginController.passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Mật khẩu',
                  prefixIcon: const Icon(Icons.lock),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Vui lòng nhập mật khẩu';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 30),

              // Nút Đăng nhập
              Obx(() {
                return authController.isLoading.value
                    ? const CircularProgressIndicator()
                    : SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton.icon(
                          onPressed: () async {
                            if (formKey.currentState!.validate()) {
                              if (loginController.rememberMe.value) {
                                final prefs =
                                    await SharedPreferences.getInstance();
                                await prefs.setString(
                                  'email',
                                  loginController.emailController.text.trim(),
                                );
                                await prefs.setString(
                                  'password',
                                  loginController.passwordController.text
                                      .trim(),
                                );
                              }

                              authController.signInWithEmail(
                                loginController.emailController.text.trim(),
                                loginController.passwordController.text.trim(),
                              );
                            }
                          },
                          icon: const Icon(Icons.login, color: Colors.white),
                          label: const Text(
                            'Đăng nhập',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                        ),
                      );
              }),

              const SizedBox(height: 20),

              // Ghi nhớ đăng nhập
              Obx(() {
                return Row(
                  children: [
                    Transform.scale(
                      scale: 1.2, // Tăng kích thước Checkbox
                      child: Checkbox(
                        value: loginController.rememberMe.value,
                        onChanged: (value) {
                          loginController.rememberMe.value = value!;
                        },
                        activeColor: Colors.green,
                        // Màu của Checkbox khi được chọn
                        checkColor: Colors.white,
                        // Màu của dấu tích
                        side: const BorderSide(color: Colors.grey, width: 1.5),
                        // Viền của Checkbox khi chưa chọn
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              4), // Bo góc nhẹ cho Checkbox
                        ),
                        materialTapTargetSize:
                            MaterialTapTargetSize.padded, // Tăng vùng chạm
                      ),
                    ),
                    const SizedBox(width: 8),
                    const Text(
                      "Ghi nhớ đăng nhập",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                );
              }),
              const SizedBox(height: 20),
              TextButton(
                onPressed: () => Get.to(() => const ForgotPassword()),
                child: const Text(
                  "Quên mật khẩu?",
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
