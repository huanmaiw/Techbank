// lib/MVC/View/Screen/Drawer/Setting/Notification SD/balence_notification.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/balance_notification_controller.dart';

class BalanceNotificationScreen extends StatelessWidget {
  const BalanceNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller
    final BalanceNotificationController controller = Get.put(BalanceNotificationController());

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Bật thông báo',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87,
                ),
              ),
              Obx(() {
                return Switch(
                  value: controller.isNotificationEnabled.value,
                  onChanged: controller.toggleNotification,
                  activeColor: Colors.white,
                  activeTrackColor: Colors.green,
                  inactiveThumbColor: Colors.white,
                  inactiveTrackColor: Colors.grey.shade300,
                  materialTapTargetSize: MaterialTapTargetSize.padded,
                  trackOutlineColor: WidgetStateProperty.resolveWith((states) {
                    return controller.isNotificationEnabled.value ? Colors.green : Colors.grey.shade300;
                  }),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
