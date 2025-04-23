import 'package:get/get.dart';
import 'package:huanmaiw/MVC/View/Screen/home_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/home_screen_login.dart';
import 'package:huanmaiw/MVC/View/Screen/login_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/phone_auth_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/register_now_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/register_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/set_password_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/splash_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/splash_second_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/type_account_screen.dart';

class Routers {
  static const splash = '/splash';
  static const splashSecond = '/splashSecond';

  static const login = '/login';
  static const home = '/home';
  static const register = '/register';
  static const setPassword = '/setPassword';
  static const phoneAuth = '/phoneAuth';
  static const forgotPassword = '/forgotPassword';
  static const verifyEmail = '/verifyEmail';
  static const resetPassword = '/resetPassword';
  static const profile = '/profile';
  static const editProfile = '/editProfile';
  static const changePassword = '/changePassword';
  static const settings = '/settings';
  static const homelogin = '/homelogin';
  static const typeAcc = '/typeAcc';
  static const registerNow = '/registerNow';
}
class GetPages {
  static final List<GetPage> pages = [
    GetPage(
      name: Routers.typeAcc,
      page: () => const TypeAccountScreen(),
    ),
    GetPage(
      name: Routers.splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: Routers.splashSecond,
      page: () => const SplashSecondScreen(),
    ),
    GetPage(
      name: Routers.login,
      page: () => LoginScreen(),

    ),
    GetPage(
      name: Routers.home,
      page: () =>  const HomeScreen(),
    ),
    GetPage(
      name: Routers.register,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routers.phoneAuth,
      page: () => const PhoneAuthScreen(),
    ),
    GetPage(
      name:Routers.setPassword,
      page: () => const SetPasswordScreen(),
    ),
    GetPage(
      name: Routers.homelogin,
      page: () => const HomeScreenLogin(),
    ),
    GetPage(
      name: Routers.registerNow,
      page: () => const RegisterNowScreen(),
    ),
  ];
}
