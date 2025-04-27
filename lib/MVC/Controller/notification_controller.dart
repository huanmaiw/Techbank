// lib/controllers/notification_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Model/notification_model.dart';

class NotificationController extends GetxController {
  var notifications = <NotificationModel>[
    NotificationModel(
      id: '1',
      title: 'Thông báo dành cho cá nhân, Thông báo dành cho doanh nghiệp',
      subtitle: 'Lịch nâng cấp dịch vụ ngân hàng',
      icon: Icons.notifications,
    ),
    NotificationModel(
      id: '2',
      title: 'Thông báo dành cho cá nhân',
      subtitle: 'Thông báo về việc thay đổi chính sách Thưởng điểm Techcombank Rewards dành cho Chủ thẻ thanh toán Techcombank Visa Eco',
      icon: Icons.notifications,
    ),
    NotificationModel(
      id: '3',
      title: 'Thông báo dành cho cá nhân, Thông báo dành cho doanh nghiệp',
      subtitle: 'Thông báo mở rộng thời gian phục vụ và lịch nghỉ lễ 30/04 – 01/05',
      icon: Icons.notifications,
    ),
  ].obs;

  void goBack() {
    Get.back();
  }
}
