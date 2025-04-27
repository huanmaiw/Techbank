import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Model/account_type_model.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';

class TypeAccountController extends GetxController {
  var accountTypes = <AccountType>[
    AccountType(
      title: 'Tài khoản cá nhân tiêu chuẩn',
     icon: 'assets/icons/standard_account.png',
      onTap: () => Get.toNamed('/register'),

  ),

    AccountType(
      title: 'Tài khoản cho doanh nghiệp',
      icon: 'assets/icons/vip_account.png',
      onTap: () {
       SnackbarHelper.showFeatureComingSoon();
      },
    ),
  ].obs;

}
