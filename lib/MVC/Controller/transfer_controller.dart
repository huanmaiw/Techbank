import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/Banking/banking_complete.dart';

class TransferController extends GetxController {
  var pinController = TextEditingController().obs;
  var isPinValid = false.obs;

  void validatePin() {
    if (pinController.value.text.length == 6) {
      isPinValid.value = true;
    } else {
      isPinValid.value = false;
    }
  }

  void onTransferSuccess() {
    // Add your transfer logic here
    Get.snackbar('Thành công', 'Chuyển khoản thành công!',
        backgroundColor: Colors.green, colorText: Colors.white);
    Get.offAll(const TransferSuccessScreen());
  }

  void onTransferError() {
    Get.snackbar('Lỗi', 'Vui lòng nhập mã PIN 6 chữ số',
        backgroundColor: Colors.red, colorText: Colors.white);
  }
}
