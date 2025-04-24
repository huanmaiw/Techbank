import 'package:firebase_auth/firebase_auth.dart';

Future<void> registerAndSendEmailVerification(String email, String password) async {
  try {
    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    if (!credential.user!.emailVerified) {
      await credential.user!.sendEmailVerification();
    }

    print("Email xác minh đã được gửi!");
  } catch (e) {
    print("Lỗi: $e");
  }
  Future<void> checkEmailVerified() async {
    final user = FirebaseAuth.instance.currentUser;

    await user?.reload(); // Cập nhật lại thông tin
    if (user != null && user.emailVerified) {
      print("Email đã xác minh!");
    } else {
      print("Email chưa xác minh.");
    }
  }

}
