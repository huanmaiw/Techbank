import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/Core/Space/insets.dart';
import 'package:huanmaiw/MVC/View/Screen/type_account_screen.dart';

class SplashButtons extends StatelessWidget {
  const SplashButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ResColor.red,
              foregroundColor: ResColor.white,
            ),
            onPressed: () {
              // TODO: Xử lý sự kiện "Tôi là khách hàng mới"
              Get.to(()=> const TypeAccountScreen());
            },
            child: const Text('Tôi là khách hàng mới'),
          ),
        ),
        ResInset.g10,
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: ResColor.white,
              foregroundColor: ResColor.black,
              side: const BorderSide(color: ResColor.black),
            ),
            onPressed: () {
              // TODO: Xử lý sự kiện "Đăng nhập"
            },
            child: const Text('Đăng nhập'),
          ),
        ),
      ],
    );
  }
}
