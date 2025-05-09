import 'package:get/get.dart';
import '../../../MVC/Model/user_model3.dart';
import '../API/api_service.dart';

class AuthController extends GetxController {
  final ApiService _api = ApiService();

  Future<void> register(String email, String password) async {
    try {
      final user = UserModel(email: email, password: password);
      await _api.register(user);
      Get.snackbar('Success', 'Registered successfully');
    } catch (e) {
      Get.snackbar('Error', 'Register failed');
    }
  }

  Future<void> login(String email, String password) async {
    try {
      final user = UserModel(email: email, password: password);
      final res = await _api.login(user);
      final token = res.data['token'];
      Get.snackbar('Success', 'Login successful: $token');
    } catch (e) {
      Get.snackbar('Error', 'Login failed');
    }
  }

  Future<void> sendOtp(String email) async {
    try {
      await _api.sendOtp(email);
      Get.snackbar('Success', 'OTP sent');
      Get.toNamed('/otp', arguments: email);
    } catch (e) {
      Get.snackbar('Error', 'Send OTP failed');
    }
  }

  Future<void> verifyOtp(String email, String otp) async {
    try {
      await _api.verifyOtp(email, otp);
      Get.snackbar('Success', 'OTP verified');
    } catch (e) {
      Get.snackbar('Error', 'Invalid OTP');
    }
  }
}
