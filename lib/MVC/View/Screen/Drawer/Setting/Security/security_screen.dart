import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/security_controller.dart';

class SecurityScreen extends StatelessWidget {
  const SecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Khởi tạo controller
    final SecurityController controller = Get.put(SecurityController());

    return Scaffold(
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
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  _buildSecurityOption(
                    icon: Icons.lock_outline,
                    label: 'Đổi mật khẩu',
                    onTap: controller.goToSetPasswordScreen,
                  ),
                  _buildSecurityOption(
                    icon: Icons.fingerprint,
                    label: 'Đổi vân tay',
                    onTap: controller.showFeatureComingSoon,
                  ),
                  _buildSecurityOption(
                    icon: Icons.face,
                    label: 'Face ID',
                    onTap: controller.showFeatureComingSoon,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSecurityOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label, style: const TextStyle(fontWeight: FontWeight.bold)),
      trailing: const Icon(Icons.chevron_right, color: Colors.black),
      onTap: onTap,
    );
  }
}
