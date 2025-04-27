import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/change_password.dart';
import 'package:huanmaiw/Core/Service/Firebase/forgot_password.dart';
import 'package:huanmaiw/MVC/Binding/bindings.dart';
import 'package:huanmaiw/MVC/Controller/balance_notification_controller.dart';
import 'package:huanmaiw/MVC/Controller/security_controller.dart';
import 'package:huanmaiw/MVC/Controller/transfer_controller.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/edit_info_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/infor_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Notification%20SD/balence_notification.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Security/security_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/Account/account_card.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/Banking/banking.dart';
import 'package:huanmaiw/MVC/View/Screen/Home/Banking/banking_complete.dart';
import 'package:huanmaiw/Core/Service/Firebase/login_screen.dart';
import 'package:huanmaiw/Core/Service/Firebase/register_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Notification/notification_screen.dart';
import 'package:huanmaiw/Core/Service/Firebase/set_password_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/settings_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Splash/splash_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Splash/splash_second_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Splash/type_account_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/home_screen.dart';

class Routers {
  static const splash = '/splash';
  static const splashSecond = '/splashSecond';
  static const login = '/login';
  static const home = '/home';
  static const register = '/register';
  static const setPassword = '/setPassword';
  static const forgotPassword = '/forgotPassword';
  static const verifyEmail = '/verifyEmail';
  static const resetPassword = '/resetPassword';
  static const changePassword = '/changePassword';
  static const typeAcc = '/typeAcc';
  static const homeTwo = '/homeTwo';
  static const drawer = '/drawer';
  static const settingsScreen = '/settingsScreen';
  static const notification = '/notification';
  static const editInfo = '/edit_info';
  static const inforScreen = '/infor_screen';
  static const balanceNotification = '/balance_notification';
  static const security = '/security';
  static const account = '/account';
}
class GetPages {
  static final List<GetPage> pages = [
    GetPage(
      name: '/home',
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: '/changePassword',
      page: () => const ChangePasswordScreen(),
      binding: ChangePasswordBinding(),
    ),
    GetPage(
      name: '/forgotPassword',
      page: () => const ForgotPasswordScreen(),
      binding: ForgotPasswordBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: '/register',
      page: () => const RegisterScreen(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: '/set-password',
      page: () => const SetPasswordScreen(),
      binding: SetPasswordBinding(),
    ),
    GetPage(
      name: '/notification',
      page: () => const NotificationScreen(),
      binding: NotificationBinding(),
    ),
    GetPage(
      name: '/edit_info',
      page: () => const EditInfoScreen(),
      binding: EditInfoBinding(),
    ),
    GetPage(
      name: '/infor_screen',
      page: () => const InforScreen(),
      binding: UserInfoBinding(),
    ),
    GetPage(
      name: '/settingsScreen',
      page: () => const SettingsScreen(),
      binding: SettingBinding(),
      ),
    GetPage(
      name: '/balance_notification',
      page: () => const BalanceNotificationScreen(),
      binding: BindingsBuilder(() {Get.put(BalanceNotificationController());
      }),
    ),
    GetPage(
      name: '/security',
      page: () => const SecurityScreen(),
      binding: BindingsBuilder(() {
        Get.put(SecurityController());
      }),
    ),
    GetPage(
      name: '/account',
      page: () =>  const AccountScreen(),
      binding:AccountBinding(),
    ),
    GetPage(
      name: '/transfer',
      page: () => const TransferScreen(),
      binding: BindingsBuilder(() {
        Get.put(TransferController());
      }),
    ),
    GetPage(
      name: '/banking',
      page: () => const TransferSuccessScreen(),
      binding: BindingsBuilder(() {
        Get.put(TransferController());
      }),
    ),
    GetPage(
      name: '/splash',
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/splashSecond',
      page: () => const SplashSecondScreen(),
      binding: SplashSecondBinding(),
    ),
    GetPage(
      name: '/typeAcc',
      page: () => const TypeAccountScreen(),
      binding: TypeAccountBinding(),
    ),

  ];
}
