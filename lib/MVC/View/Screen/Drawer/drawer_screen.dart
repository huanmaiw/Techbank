import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/MVC/Widget/open_link.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';
import 'Notification/notification_screen.dart';
import 'Setting/Information/settings_screen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  _DrawerScreenState createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFFFFF4DD),
      child: SafeArea(
        child: Column(
          children: [
            // Header
            Container(
              color: Colors.black,
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              width: double.infinity,
              child: Row(
                children: [
                  Image.asset(
                    'assets/logo/splash.png',
                    height: 50,
                    color: Colors.red,
                  ),
                  const SizedBox(width: 10),
                  const Text(
                    "Xin chào,\nKIEU MAI HUAN",
                    style: TextStyle(
                      fontFamily: 'Inter',
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  IconButton(
                    icon: const Icon(Icons.close, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  _buildItem(
                    Icons.notifications_none, "Thông báo",
                    badge: "4",
                    onTap: () {
                      // Sử dụng Navigator để điều hướng đến SettingsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const NotificationScreen()),
                      );
                    },
                  ),
                  _buildItem(
                    Icons.card_giftcard, "Ưu đãi",
                    onTap: SnackbarHelper.showFeatureComingSoon,
                  ),
                  _buildItem(
                    Icons.settings, "Cài đặt",
                    onTap: () {
                      // Sử dụng Navigator để điều hướng đến SettingsScreen
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SettingsScreen()),
                      );
                    },
                    // onTap: () => _onItemTapped(const SettingsScreen()), // Chuyển qua màn Cài đặt trong Drawer
                  ),
                  _buildItem(
                    Icons.people_alt_outlined, "Giới thiệu bạn bè",
                    onTap: () {
                      Get.dialog(
                        AlertDialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          backgroundColor: ResColor.backgroundColor,
                          title: const Row(
                            children: [
                              SizedBox(width: 8),
                              Text(
                                'Mã giới thiệu',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text(
                                'Mã của bạn:',
                                style: TextStyle(fontSize: 16, color: ResColor.titleColor),
                              ),
                              const SizedBox(height: 8),
                              Container(
                                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                                decoration: BoxDecoration(
                                  color: ResColor.boxColor,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: ResColor.borderColor),
                                ),
                                child: const Text(
                                  'APTX-4869',
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: ResColor.primaryColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: TextButton.styleFrom(
                                foregroundColor: ResColor.primaryColor,
                              ),
                              child: const Text(
                                'OK',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: GestureDetector(
                        onTap: SnackbarHelper.showFeatureComingSoon,
                        child: Container(
                          decoration: BoxDecoration(
                            color: ResColor.theme,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: ResColor.primaryColor,
                              width: 1, // Độ rộng viền
                            ),
                          ),
                          child: const ListTile(
                            leading: Icon(Icons.location_on_outlined, color: Colors.blue),
                            title: Text("Tra cứu địa chỉ chi nhánh và ATM"),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Logout & Support
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Get.toNamed(Routers.login);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: const Text("Đăng xuất"),
                  ),
                  const Spacer(),
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
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildItem(IconData icon, String label, {String? badge, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.black),
      title: Text(label),
      trailing: badge != null
          ? Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        decoration: const BoxDecoration(
          color: Colors.red,
          shape: BoxShape.circle,
        ),
        child: Text(
          badge,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        ),
      )
          : null,
      onTap: onTap,
    );
  }
}
