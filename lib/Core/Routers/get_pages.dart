import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:huanmaiw/Core/Service/Firebase/change_password.dart';
import 'package:huanmaiw/Core/Service/Firebase/forgot_password.dart';
import 'package:huanmaiw/MVC/Binding/bindings.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/drawer_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/home_screen.dart';
import 'package:huanmaiw/Core/Service/Firebase/login_screen.dart';
import 'package:huanmaiw/Core/Service/Firebase/register_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Notification/notification_screen.dart';
import 'package:huanmaiw/Core/Service/Firebase/set_password_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Drawer/Setting/Information/settings_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Splash/splash_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Splash/splash_second_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/Splash/type_account_screen.dart';

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
  static const setTings = '/setTings';
  static const notification = '/notification';
}
class GetPages {
  static final List<GetPage> pages = [

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
      page: () => const LoginScreen(),
      transition: Transition.fade,
      transitionDuration: const Duration(milliseconds: 500),
    ),
    // GetPage(
    //   name: Routers.forgotPassword,
    //   page: () => const ForgotPassword(),
    //   transition: Transition.size,
    //   transitionDuration: const Duration(milliseconds: 500),
    // ),
    GetPage(
      name: Routers.typeAcc,
      page: () => const TypeAccountScreen(),

    ),
    GetPage(
      name: Routers.register,
      page: () => const RegisterScreen(),
      transition: Transition.cupertino,
      transitionDuration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    ),
    GetPage(
      name:Routers.setPassword,
      page: () => const SetPasswordScreen(),
    ),
    GetPage(
      name: Routers.home,
      page: () =>  const HomeScreen(),
    ),
    GetPage(
      name: Routers.drawer,
      page: () =>  const DrawerScreen(
      ),
    ),
    GetPage(
      name: Routers.setTings,
      page: () =>  const SettingsScreen(),
    ),
    GetPage(
      name: Routers.notification,
      page: () =>  const NotificationScreen(),
    ),
    //------------------------------------------------
    // GetPage(
    //   name: '/change-password',
    //   page: () => const ChangePasswordScreen(),
    //   binding: ChangePasswordBinding(),
    // ),
    // GetPage(
    //   name: '/forgot-password',
    //   page: () => const ForgotPasswordScreen(),
    //   binding: ForgotPasswordBinding(),
    // ),
    // GetPage(
    //   name: '/login',
    //   page: () => const LoginScreen(),
    //   binding: LoginBinding(),
    // ),
    // GetPage(
    //   name: '/register',
    //   page: () => const RegisterScreen(),
    //   binding: RegisterBinding(),
    // ),
    // GetPage(
    //   name: '/set-password',
    //   page: () => const SetPasswordScreen(),
    //   binding: SetPasswordBinding(),
    // ),

  ];
}
