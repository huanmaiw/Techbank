import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  static final _auth = FirebaseAuth.instance;

  static Future<void> signInWithEmail(String email, String password) async {
    try {

      await _auth.setLanguageCode('vi');

      // Đăng nhập với email và mật khẩu
      final userCred = await _auth.signInWithEmailAndPassword(
        email: email.trim(),
        password: password,
      );

      // Kiểm tra xem user có tồn tại không
      if (userCred.user == null) {
        throw Exception('Không tìm thấy người dùng. Vui lòng kiểm tra lại email hoặc mật khẩu.');
      }
    } on FirebaseAuthException catch (e) {
      // Xử lý lỗi cụ thể từ Firebase
      if (e.code == 'user-not-found') {
        throw Exception('Không tìm thấy tài khoản với email này.');
      } else if (e.code == 'wrong-password') {
        throw Exception('Mật khẩu không đúng. Vui lòng thử lại.');
      } else if (e.code == 'invalid-email') {
        throw Exception('Email không hợp lệ. Vui lòng kiểm tra lại.');
      } else {
        throw Exception('Đăng nhập thất bại: ${e.message}');
      }
    } catch (e) {
      throw Exception('Đăng nhập thất bại: $e');
    }
  }
  // Đăng ký
  static Future<void> registerWithEmail(String email, String password) async {
    final userCred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
    if (!userCred.user!.emailVerified) {
      await userCred.user!.sendEmailVerification();
    }
  }

  // Gửi mail reset password
  static Future<void> sendPasswordResetEmail(String email) async {
    await _auth.sendPasswordResetEmail(email: email);
  }

  // Đổi mật khẩu
  static Future<void> changePassword(String currentPassword, String newPassword) async {
    final user = _auth.currentUser;
    if (user == null || user.email == null) return;

    final cred = EmailAuthProvider.credential(email: user.email!, password: currentPassword);
    await user.reauthenticateWithCredential(cred);
    await user.updatePassword(newPassword);
  }

  // Kiểm tra email đã xác minh chưa
  static Future<bool> checkEmailVerified() async {
    final user = _auth.currentUser;
    await user?.reload();
    return user?.emailVerified ?? false;
  }

  // Gửi lại email xác minh
  static Future<void> resendVerificationEmail() async {
    final user = _auth.currentUser;
    if (user != null && !user.emailVerified) {
      await user.sendEmailVerification();
    }
  }
}
