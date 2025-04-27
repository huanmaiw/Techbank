// lib/controllers/security_controller.dart
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/set_password_screen.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';

class SecurityController extends GetxController {
  void goToSetPasswordScreen() {
    Get.to(() => const SetPasswordScreen());
  }

  void showFeatureComingSoon() {
    SnackbarHelper.showFeatureComingSoon();
  }
}
