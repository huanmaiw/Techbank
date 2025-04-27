import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Model/user_model2.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/edit_info_screen.dart';


class UserInfoController extends GetxController {
  var user = UserModel2(
    name: 'Nguyễn Văn A',
    email: 'vana@gmail.com',
    password: '********',
    accountNumber: '1234 5678 9101 1121',
    balance: '5.000.000 VNĐ',
  ).obs;

  // Hàm chuyển sang màn hình chỉnh sửa thông tin
  void editUserInfo() {
    Get.to(() => const EditInfoScreen());
  }
}
