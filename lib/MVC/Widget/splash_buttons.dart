import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
import 'package:huanmaiw/Core/Space/insets.dart';

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
            onPressed: () => Get.toNamed(Routers.typeAcc,),
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
            onPressed: () => Get.toNamed(Routers.login,),
            child: const Text('Đăng nhập'),
          ),
        ),
      ],
    );
  }
}
