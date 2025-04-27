import 'package:get/get.dart';

class ChangePasswordController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;

  // Hàm đổi mật khẩu
  Future<void> changePassword(String currentPassword, String newPassword) async {
    isLoading.value = true;
    errorMessage.value = ''; // Reset thông báo lỗi

    // Giả lập gọi API để đổi mật khẩu
    await Future.delayed(const Duration(seconds: 2)); // Giả lập delay của API

    // Nếu thành công
    isLoading.value = false;
    // Gọi API và xử lý nếu có lỗi hoặc thành công
    // Cập nhật thông báo nếu có lỗi
    // errorMessage.value = 'Lỗi xảy ra, thử lại sau';
  }
}
