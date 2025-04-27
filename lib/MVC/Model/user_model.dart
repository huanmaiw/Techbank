// lib/models/user_model.dart
class UserModel {
  String name;
  String email;
  String? avatarPath; // Đường dẫn ảnh đại diện

  UserModel({
    required this.name,
    required this.email,
    this.avatarPath,
  });
}
