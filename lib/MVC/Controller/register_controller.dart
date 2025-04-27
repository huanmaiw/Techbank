import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/Core/Service/Firebase/auth_service.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';

class RegisterController extends GetxController {
  var isLoading = false.obs;
  var errorMessage = ''.obs;


  Future<void> registerWithEmail(String email, String password) async {
    isLoading.value = true;
    try {
      await AuthService.registerWithEmail(email, password);
      Get.offAllNamed(Routers.login);
      SnackbarHelper.showSuccess('Thành công', 'Đăng ký thành công');

    } catch (e) {
      errorMessage.value = 'Đăng ký thất bại: $e';
      SnackbarHelper.showError('Lỗi', errorMessage.value);
    } finally {
      isLoading.value = false;
    }
  }
}
