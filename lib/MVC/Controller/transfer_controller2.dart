// lib/MVC/Controller/transfer_controller.dart

import 'package:get/get.dart';
import '../Model/transfer_model.dart';

class TransferController extends GetxController {
  Rx<TransferModel> transferModel = TransferModel(
    bankName: 'Techcombank',
    accountNumber: '4826777778',
    description: 'TEST DAMES',
    transactionDate: '25 Tháng 4, 2025',
    transactionCode: 'FT23045G6S5124194',
    amount: '500,000,000 VND',
    recipientName: 'TRAN MAI HUAN',
  ).obs;

  // Chức năng có thể gọi API, chuyển trang...
  void completeTransfer() {
    Get.offAllNamed('/home');  // Ví dụ chuyển về HomeScreen
  }
}
