import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/MVC/Widget/open_link.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';

class DrawerController extends GetxController {
  void goToNotificationScreen() {
    Get.toNamed('/notification');
  }

  void showFeatureComingSoon() {
    SnackbarHelper.showFeatureComingSoon();
  }

  void goToSettingsScreen() {
    Get.toNamed('/settingsScreen');
  }

  void logout() {
    Get.defaultDialog(
      title: 'Xác nhận',
      middleText: 'Bạn có chắc chắn muốn đăng xuất không?',
      textCancel: 'Hủy',
      textConfirm: 'Đăng xuất',
      cancelTextColor: ResColor.black,
      confirmTextColor: ResColor.white,
      backgroundColor: ResColor.white,
      radius: 15,
      barrierDismissible: false,
      contentPadding: const EdgeInsets.all(20),
      onConfirm: () {
        Get.offAllNamed('/login');
      },
      buttonColor: ResColor.red,
    );
  }
  void showSupportInfo() {
    TextButton(
      onPressed: () {
        Get.bottomSheet(
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 40,
                  height: 5,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(height: 20),
                ListTile(
                  leading: const Icon(Icons.facebook, size: 32, color: Colors.blue),
                  title: const Text(
                    'Facebook: Kiệu Mai Huấn',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    OpenLink().launchURL('https://www.facebook.com/profile.php?id=61560768990877');
                  },
                ),
                const Divider(),
                ListTile(
                  leading: const Icon(Icons.phone, size: 32, color: Colors.green),
                  title: const Text(
                    'Zalo / SĐT: 0393433084',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                  onTap: () {
                    OpenLink().launchURL('https://www.facebook.com/profile.php?id=61560768990877');
                  },
                ),
              ],
            ),
          ),
          isScrollControlled: true, // Cho phép bottomSheet cao hơn
          backgroundColor: Colors.transparent, // Làm nền trong suốt để thấy góc bo
        );
      },
      child: const Text("Hỗ trợ"),
    );
  }
}
