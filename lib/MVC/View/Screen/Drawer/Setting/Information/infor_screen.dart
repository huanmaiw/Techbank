import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/user_info_controller.dart';

class InforScreen extends StatelessWidget {
  const InforScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final UserInfoController controller = Get.put(UserInfoController());

    return Scaffold(
      backgroundColor: const Color(0xFFFFF4DD),
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
                  const Center(
                    child: CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/logo/avt.jpg'),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Obx(() {
                    return InfoCard(title: 'Họ tên', value: controller.user.value.name);
                  }),
                  Obx(() {
                    return InfoCard(title: 'Email', value: controller.user.value.email);
                  }),
                  Obx(() {
                    return InfoCard(title: 'Mật khẩu', value: controller.user.value.password);
                  }),
                  Obx(() {
                    return InfoCard(title: 'Số tài khoản', value: controller.user.value.accountNumber);
                  }),
                  Obx(() {
                    return InfoCard(title: 'Số dư', value: controller.user.value.balance);
                  }),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      minimumSize: const Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    onPressed: controller.editUserInfo,
                    child: const Text(
                      'Chỉnh sửa thông tin',
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String value;

  const InfoCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 16),
      margin: const EdgeInsets.symmetric(vertical: 6),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            value,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
