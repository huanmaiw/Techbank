import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/edit_info_controller.dart';

class EditInfoScreen extends StatelessWidget {
  const EditInfoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final EditInfoController controller = Get.put(EditInfoController());

    return Scaffold(
      appBar: AppBar(title: const Text('Chỉnh sửa thông tin')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Obx(() {
              return Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: controller.user.value.avatarPath != null
                        ? FileImage(File(controller.user.value.avatarPath!))
                        : const AssetImage('assets/logo/avt.jpg') as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: GestureDetector(
                      onTap: controller.pickImage,
                      child: Container(
                        padding: const EdgeInsets.all(6),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.transparent,
                        ),
                        child: const Icon(
                          Icons.camera_alt,
                          color: Colors.black,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ],
              );
            }),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: controller.user.value.name),
              decoration: const InputDecoration(labelText: 'Họ tên'),
              onChanged: (value) {
                controller.user.update((user) {
                  user?.name = value;
                });
              },
            ),
            const SizedBox(height: 16),
            TextField(
              controller: TextEditingController(text: controller.user.value.email),
              decoration: const InputDecoration(labelText: 'Email'),
              onChanged: (value) {
                controller.user.update((user) {
                  user?.email = value;
                });
              },
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.saveChanges,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text('Lưu thay đổi', style: TextStyle(color: Colors.white)),
            ),
          ],
        ),
      ),
    );
  }
}
