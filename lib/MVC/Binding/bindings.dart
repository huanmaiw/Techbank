import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/auth_controller.dart';
import 'package:huanmaiw/MVC/Controller/account_controller.dart';
import 'package:huanmaiw/MVC/Controller/change_password_controller.dart';
import 'package:huanmaiw/MVC/Controller/edit_info_controller.dart';
import 'package:huanmaiw/MVC/Controller/forgot_password_controller.dart';
import 'package:huanmaiw/MVC/Controller/home_controller.dart';
import 'package:huanmaiw/MVC/Controller/login_controller.dart';
import 'package:huanmaiw/MVC/Controller/notification_controller.dart';
import 'package:huanmaiw/MVC/Controller/register_controller.dart';
import 'package:huanmaiw/MVC/Controller/set_password_controller.dart';
import 'package:huanmaiw/MVC/Controller/settings_controller.dart';
import 'package:huanmaiw/MVC/Controller/splash_second_controller.dart';
import 'package:huanmaiw/MVC/Controller/transfer_controller.dart';
import 'package:huanmaiw/MVC/Controller/type_account_controller.dart';
import 'package:huanmaiw/MVC/Controller/user_info_controller.dart';

import '../Controller/splash_controller.dart';

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
    Get.put(AuthController());
    Get.put(LoginController());
  }
}
class RegisterBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RegisterController());
  }
}
class SetPasswordBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(SetPasswordController());
  }
}
class NotificationBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(NotificationController());
  }
}
class EditInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(EditInfoController());
  }
}
class UserInfoBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(UserInfoController());
  }
}
class AccountBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AccountController>(() => AccountController());
  }
}
class TransferBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(TransferController());
  }
}
class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SplashController());
  }
}
class SplashSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashSecondController>(() => SplashSecondController());
  }
}
class TypeAccountBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => TypeAccountController());
  }
}
class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}
class SettingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SettingsController());
  }
}
