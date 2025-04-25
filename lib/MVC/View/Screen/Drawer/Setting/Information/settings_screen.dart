import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/infor_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Notification%20SD/balence_notification.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Security/security_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ResColor.theme,
      body:
      SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Get.back();
            },
                icon: const Icon(Icons.arrow_back_ios, color: Colors.black)),
            ResInset.g4,
            Expanded(
              child: ListView(
                children: [
                  _buildSettingItem(
                    icon: Icons.account_circle_outlined,
                    label: 'Thông tin cá nhân',
                    onTap: () {
                      Get.to(() => const InforScreen());
                    },
                  ),
                  _buildSettingItem(
                    icon: Icons.notifications,
                    label: 'Thông báo biến động số dư',
                    onTap: () {
                      Get.to(() => const BalanceNotificationScreen());
                    },
                  ),
                  _buildSettingItem(
                    icon: Icons.security,
                    label: 'Bảo mật',
                    onTap: () {
                      Get.to(()=> const SecurityScreen());
                    },
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
