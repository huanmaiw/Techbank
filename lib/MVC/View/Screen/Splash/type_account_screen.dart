import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/MVC/Controller/type_account_controller.dart';
import 'package:huanmaiw/MVC/Widget/account_type_card.dart';

class TypeAccountScreen extends StatelessWidget {
  const TypeAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TypeAccountController());

    return Scaffold(
      backgroundColor: ResColor.theme,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 16),
              const Text(
                'Xin chào!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),
              const Text(
                'Bạn đang quan tâm đến tài khoản nào?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black54,
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Expanded(
                child: Obx(() {
                  return ListView(
                    children: controller.accountTypes.map((type) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 24),
                        child: AccountTypeCard(
                          icon: getIconData(type.icon),
                          title: type.title,
                          onTap: type.onTap,
                          cardColor: type.title == 'Tài khoản cá nhân tiêu chuẩn'
                              ? Colors.red
                              : Colors.green,
                        ),
                      );
                    }).toList(),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

getIconData(String icon) {
  switch (icon) {
    case 'user':
      return Icons.person;
    case 'business':
      return Icons.business;
    case 'bank':
      return Icons.account_balance;
    default:
      return Icons.error;
  }
}
