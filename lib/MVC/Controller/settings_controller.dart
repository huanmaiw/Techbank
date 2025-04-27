import 'package:get/get.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/infor_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Notification%20SD/balence_notification.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Security/security_screen.dart';

class SettingsController extends GetxController {
  void goToPersonalInfo() {
    Get.to(() => const InforScreen());
  }

  void goToBalanceNotification() {
    Get.to(() => const BalanceNotificationScreen());
  }

  void goToSecurity() {
    Get.to(() => const SecurityScreen());
  }
}
