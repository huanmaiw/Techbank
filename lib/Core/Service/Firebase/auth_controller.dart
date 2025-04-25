import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';
import 'auth_service.dart';
class AuthController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Đăng nhập
  Future<void> signInWithEmail(String email, String password) async {
    isLoading.value = true;
    try {
      await AuthService.signInWithEmail(email, password);
      SnackbarHelper.showSuccess('Thành công', 'Đăng nhập thành công');
      Get.offNamed(Routers.home);
    } catch (e) {
      errorMessage.value = 'Đăng nhập thất bại: $e';
      SnackbarHelper.showError('Lỗi', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Đăng ký
  Future<void> registerWithEmail(String email, String password) async {
    isLoading.value = true;
    try {
      await AuthService.registerWithEmail(email, password);
      SnackbarHelper.showSuccess('Thành công', 'Đăng ký thành công với email $email');
    } catch (e) {
      errorMessage.value = 'Đăng ký thất bại: $e';
      SnackbarHelper.showError('Lỗi', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Gửi email reset password
  Future<void> sendPasswordResetEmail(String email) async {
    isLoading.value = true;
    try {
      await AuthService.sendPasswordResetEmail(email);
      SnackbarHelper.showSuccess('Thành công', 'Đã gửi link đặt lại mật khẩu đến $email');
    } catch (e) {
      errorMessage.value = 'Không thể gửi email reset: $e';
      SnackbarHelper.showError('Lỗi', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Đổi mật khẩu
  Future<void> changePassword(String currentPassword, String newPassword) async {
    isLoading.value = true;
    try {
      await AuthService.changePassword(currentPassword, newPassword);
      SnackbarHelper.showSuccess('Thành công', 'Đổi mật khẩu thành công');
    } catch (e) {
      errorMessage.value = 'Lỗi đổi mật khẩu: $e';
      SnackbarHelper.showError('Lỗi', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

  // Kiểm tra email đã xác minh
  Future<bool> checkEmailVerified() async {
    return await AuthService.checkEmailVerified();
  }

  // Gửi lại email xác minh
  Future<void> resendVerificationEmail() async {
    isLoading.value = true;
    try {
      await AuthService.resendVerificationEmail();
      SnackbarHelper.showSuccess('Thành công', 'Đã gửi lại email xác minh');
    } catch (e) {
      errorMessage.value = 'Lỗi gửi lại email xác minh: $e';
      SnackbarHelper.showError('Lỗi', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }

}
