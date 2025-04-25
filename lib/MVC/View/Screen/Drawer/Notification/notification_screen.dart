import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Space/Color/res_color.dart';
class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(onPressed: (){
              Get.back();
            }, icon: const Icon(Icons.arrow_back_ios)),
            const Expanded(
              child: Expanded(
                child: Column(
                  children: [
                    ListTile(
                      leading:  Icon(Icons.notifications, color: Colors.red),
                      title:  Text('Thông báo dành cho cá nhân, Thông báo dành cho doanh nghiệp',
                          style: TextStyle(fontWeight: FontWeight.bold,
                              fontFamily: "Inter", color: ResColor.red)),
                      subtitle:  Text('Lịch nâng cấp dịch vụ ngân hàng'),
                    //  trailing:  Icon(Icons.chevron_right, color: Colors.black),
                    ),
                     Divider(),
                    ListTile(
                      leading:  Icon(Icons.notifications, color: Colors.red),
                      title:  Text('Thông báo dành cho cá nhân', style: TextStyle(fontWeight: FontWeight.bold, color: ResColor.red)),
                      subtitle:  Text('Thông báo về việc thay đổi chính sách Thưởng điểm Techcombank Rewards dành cho Chủ thẻ thanh toán Techcombank Visa Eco'),
                    //  trailing:  Icon(Icons.chevron_right, color: Colors.black),

                    ),
                     Divider(),
                    ListTile(
                      leading:  Icon(Icons.notifications, color: Colors.red),
                      title:  Text('Thông báo dành cho cá nhân, Thông báo dành cho doanh nghiệp',
                          style: TextStyle(fontWeight: FontWeight.bold, color: ResColor.red)),
                      subtitle:  Text('Thông báo mở rộng thời gian phục vụ và lịch nghỉ lễ 30/04 – 01/05'),
                      //  trailing:  Icon(Icons.chevron_right, color: Colors.black),

                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
