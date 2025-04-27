import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/Controller/settings_controller.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final SettingsController controller = Get.put(SettingsController());

    return Scaffold(
      backgroundColor: ResColor.theme,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
            ),
            ResInset.g4,
            Expanded(
              child: ListView(
                children: [
                  _buildSettingItem(
                    icon: Icons.account_circle_outlined,
                    label: 'Thông tin cá nhân',
                    onTap: controller.goToPersonalInfo,
                  ),
                  _buildSettingItem(
                    icon: Icons.notifications,
                    label: 'Thông báo biến động số dư',
                    onTap: controller.goToBalanceNotification,
                  ),
                  _buildSettingItem(
                    icon: Icons.security,
                    label: 'Bảo mật',
                    onTap: controller.goToSecurity,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem({required IconData icon, required String label, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }
}
