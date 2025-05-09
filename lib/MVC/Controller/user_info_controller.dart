import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Model/user_model2.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/edit_info_screen.dart';


class UserInfoController extends GetxController {
  var user = UserModel2(
    name: 'Kiệu Mai Huấn',
    email: 'huan@gmail.com',
    password: '********',
    accountNumber: '1234 5678 9101 1121',
    balance: '10.000.000.000 VNĐ',
  ).obs;

  void editUserInfo() {
    Get.to(() => const EditInfoScreen());
  }
}
