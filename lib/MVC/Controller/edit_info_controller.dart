// lib/controllers/edit_info_controller.dart

import 'package:get/get.dart';
import 'package:huanmaiw/MVC/Model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:huanmaiw/MVC/Widget/snackbar_helper.dart';

class EditInfoController extends GetxController {
  var user = UserModel(name: "Nguyễn Văn A", email: "vana@gmail.com").obs;
  final ImagePicker _picker = ImagePicker();

  // Hàm chọn ảnh từ thư viện
  Future<void> pickImage() async {
    try {
      PermissionStatus status = await Permission.photos.request();
      if (status.isGranted) {
        final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
        if (pickedFile != null) {
          user.update((user) {
            user?.avatarPath = pickedFile.path;
          });
          Get.snackbar("Thông báo", "Đã chọn ảnh thành công");
        } else {
          Get.snackbar("Thông báo", "Không chọn được ảnh");
        }
      } else {
        Get.snackbar("Lỗi", "Quyền truy cập thư viện ảnh bị từ chối");
      }
    } catch (e) {
      Get.snackbar("Lỗi", "Không thể chọn ảnh: $e");
    }
  }

  // Hàm lưu thay đổi
  void saveChanges() {
    SnackbarHelper.showSuccess("Thành công", "Thông tin đã được lưu thành công");
  }
}
