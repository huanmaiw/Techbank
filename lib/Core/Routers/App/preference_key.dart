class PreferenceKey {
  PreferenceKey._(); // Prevent instantiation

  // Ngôn ngữ & Giao diện
  static const String currentLanguage = "CURRENT_LANGUAGE";
  static const String currentTheme = "CURRENT_THEME";

  // Đăng nhập & Xác thực
  static const String isLoggedIn = "IS_LOGGED_IN";
  static const String accessToken = "ACCESS_TOKEN";
  static const String refreshToken = "REFRESH_TOKEN";
  static const String deviceToken = "DEVICE_TOKEN";

  // Ghi nhớ đăng nhập
  static const String isRememberMe = "IS_REMEMBER_ME";
  static const String savedEmail = "SAVED_EMAIL";
  static const String savedPassword = "SAVED_PASSWORD";

  // Người dùng
  static const String userId = "USER_ID";
  static const String userFullName = "USER_FULL_NAME";
  static const String userPhone = "USER_PHONE";
  static const String userEmail = "USER_EMAIL";
  static const String userAvatar = "USER_AVATAR";

  // Tài khoản ngân hàng
  static const String selectedAccountId = "SELECTED_ACCOUNT_ID";
  static const String selectedAccountNumber = "SELECTED_ACCOUNT_NUMBER";

  // Bảo mật sinh trắc học
  static const String isBiometricEnabled = "IS_BIOMETRIC_ENABLED";
  static const String isVerifiedBiometric = "IS_VERIFIED_BIOMETRIC";

  // Cấu hình ví & QR
  static const String defaultWalletId = "DEFAULT_WALLET_ID";
  static const String lastScannedQr = "LAST_SCANNED_QR";

  // Cài đặt nâng cao
  static const String rootEmail = "ROOT_EMAIL";
  static const String rootPassword = "ROOT_PASSWORD";
}
