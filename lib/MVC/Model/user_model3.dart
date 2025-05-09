class UserModel {
  final String email;
  final String password;

  UserModel({required this.email, required this.password});

  Map<String, dynamic> toJson() => {
    'email': email,
    'password': password,
  };
}
