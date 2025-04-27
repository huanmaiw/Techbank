import 'package:flutter/material.dart';

class NotificationModel {
  final String title;
  final String subtitle;
  final IconData icon;
  final String id;

  NotificationModel({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.id,
  });
}
