import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/Account/account_card.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/Banking/banking.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/QR/scan_qr.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';
class HomeController extends GetxController {
  // Hàm mở Drawer
  void openDrawer(BuildContext context) {
    Scaffold.of(context).openDrawer();
  }

  // Hàm xử lý khi nhấn vào các mục
  void handleItemTap(int index) {
    switch (index) {
      case 0:
        Get.to(() =>  const AccountScreen());
        break;
      case 1:
        Get.bottomSheet(
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      Container(
                        width: 40,
                        height: 5,
                        decoration: BoxDecoration(
                          color: Colors.grey.shade300,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Chuyển khoản qua số tài khoản',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.supervisor_account_sharp,
                    color: Colors.blueAccent,
                    size: 40,
                  ),
                  title: const Text(
                    'Giao dịch giữa các tài khoản Techcombank',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    Get.offAll(() => const TransferScreen());
                  },
                  tileColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                ),
                const Divider(height: 1, thickness: 1, color: Colors.grey),
                ListTile(
                  leading: const Icon(
                    Icons.account_balance,
                    color: Colors.orangeAccent,
                    size: 40,
                  ),
                  title: const Text(
                    'Giao dịch qua các ngân hàng khác',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                    ),
                  ),
                  onTap: () {
                    SnackbarHelper.showFeatureComingSoon();
                  },
                  tileColor: Colors.grey.shade50,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          isScrollControlled: true,
          enableDrag: true,
          isDismissible: true,
        );
        break;
      case 2:
        Get.to(() => const QRScanScreen());
        break;
      default:
        SnackbarHelper.showFeatureComingSoon();
    }
  }
}
