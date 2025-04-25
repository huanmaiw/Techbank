import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/change_password_controller.dart';
import 'package:huanmaiw/MVC/Controller/forgot_password_controller.dart';
import 'package:huanmaiw/MVC/Controller/login_controller.dart';
import 'package:huanmaiw/MVC/Controller/register_controller.dart';
import 'package:huanmaiw/MVC/Controller/set_password_controller.dart';

class ChangePasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordController());
  }
}

class ForgotPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgotPasswordController());
  }
}
class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RegisterController>(() => RegisterController());
  }
}class SetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SetPasswordController>(() => SetPasswordController());
  }
}