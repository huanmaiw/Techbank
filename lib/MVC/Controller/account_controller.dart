import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Model/transaction_model.dart';

class AccountController extends GetxController {
  var selectedTab = 0.obs;
  var transactionHistory = <Transaction>[
    Transaction(
      title: 'Nhận tiền từ KIEU MAI HUAN',
      date: '25/04/2025',
      amount: '+ 50,000,000,000',
    ),
    Transaction(
      title: 'Chuyển tiền đến LUU VAN DUONG',
      date: '20/04/2025',
      amount: '- 500,000,000',
    ),
    Transaction(
      title: 'Nhận tiền từ TRAN THU TRANG',
      date: '19/04/2025',
      amount: '+ 10,000,000',
    ),
    Transaction(
      title: 'Chuyển tiền đến NGUYEN MINH CHIEN',
      date: '18/04/2025',
      amount: '- 1,000,000,000',
    ),
    Transaction(
      title: 'Nhận tiền từ NGUYEN QUANG HUY',
      date: '12/04/2025',
      amount: '+ 10,000,000',
    ),
  ].obs;

  // Thay đổi tab hiện tại
  void changeTab(int index) {
    selectedTab(index);
  }
}
