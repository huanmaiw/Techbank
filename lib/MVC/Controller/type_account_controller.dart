import 'package:get/get.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:huanmaiw/Core/Routers/get_pages.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';
import '../Model/account_type_model.dart';
class TypeAccountController extends GetxController {
  final accountTypes = <AccountTypeModel>[].obs;
  @override
  void onInit() {
    super.onInit();
    loadAccountTypes();
  }
  void loadAccountTypes() {
    accountTypes.value = [
      AccountTypeModel(
        title: 'Tài khoản cá nhân tiêu chuẩn',
        icon: FontAwesomeIcons.facebook,
        onTap: () => Get.toNamed(Routers.register),
      ),
      AccountTypeModel(
        title: 'Tài khoản doanh nghiệp',
        icon: FontAwesomeIcons.apple,
        onTap: () => SnackbarHelper.showFeatureComingSoon(),
      ),
    ];
  }
}
