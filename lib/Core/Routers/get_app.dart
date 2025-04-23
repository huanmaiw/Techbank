import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'App/theme_app.dart';
import 'get_pages.dart';

class GetApp extends StatelessWidget {
  const GetApp({super.key});
// giao diện chính của app
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lunar Calendar Event',
      debugShowCheckedModeBanner: false,
      initialRoute: Routers.splash,
      defaultTransition: Transition.cupertino,
      getPages: GetPages.pages,
      theme: AppTheme.lightTheme,
      themeMode: ThemeMode.system,
      //builder: EasyLoading.init(),
      popGesture: true,
      //initialBinding: AppBindings(),
    );
  }
}
