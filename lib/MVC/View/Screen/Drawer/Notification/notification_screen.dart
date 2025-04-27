// lib/views/notification_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Controller/notification_controller.dart';
import 'package:huanmaiw/MVC/Model/notification_model.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final NotificationController controller = Get.put(NotificationController());

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              onPressed: controller.goBack,
              icon: const Icon(Icons.arrow_back_ios),
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                  itemCount: controller.notifications.length,
                  itemBuilder: (context, index) {
                    NotificationModel notification = controller.notifications[index];
                    return Column(
                      children: [
                        ListTile(
                          leading: Icon(notification.icon, color: Colors.red),
                          title: Text(
                            notification.title,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: "Inter",
                              color: ResColor.red,
                            ),
                          ),
                          subtitle: Text(notification.subtitle),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
