import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Hàm gửi email reset mật khẩu
  Future<void> sendPasswordResetEmail(String email) async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset lỗi trước khi gửi yêu cầu mới

    // Giả lập gửi email (thực tế bạn sẽ gọi API Firebase hoặc backend của bạn ở đây)
    await Future.delayed(const Duration(seconds: 2));

    isLoading.value = false;
    // Nếu có lỗi xảy ra
    // errorMessage.value = 'Lỗi gửi email, thử lại sau!';

    // Nếu thành công
    // errorMessage.value = ''; // Không có lỗi
  }
}
