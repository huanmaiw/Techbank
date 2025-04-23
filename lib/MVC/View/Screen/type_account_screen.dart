import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/Widget/account_type_card.dart';

import 'register_now_screen.dart';

class TypeAccountScreen extends StatelessWidget {
  const TypeAccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SafeArea(
            child: Center(
              child: Column(
                children: [
                  const Text(
                    'Xin chào, bạn đang quan tâm đến sản phẩm nào?',
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  ResInset.g4,
                  const Text(
                    "Tất cả sản phẩm đều có tính năng sinh lời tự động",
                    style: TextStyle(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                  ResInset.g32,
                  const Spacer(),
                  AccountTypeCard(
                    icon: FontAwesomeIcons.facebook,
                    title: "Tài khoản cá nhân tiêu chuẩn",
                    onTap: () {
                     Get.to(()=> const RegisterNowScreen());
                    },
                  ),
                  ResInset.g28,
                  AccountTypeCard(
                    icon: FontAwesomeIcons.apple,
                    title: "Tài khoản doanh nghiệp",
                    onTap: () {
                     // print("Đã ấn doanh nghiệp");
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
