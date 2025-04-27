// lib/controllers/balance_notification_controller.dart
import 'package:get/get.dart';

class BalanceNotificationController extends GetxController {
  var isNotificationEnabled = false.obs;

  void toggleNotification(bool value) {
    isNotificationEnabled.value = value;
  }
}
