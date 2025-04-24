import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:huanmaiw/Core/Service/Firebase/login_screen.dart';
import 'package:huanmaiw/MVC/View/Screen/home_screen.dart';

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        }
        if (snapshot.hasData) {
          return const HomeScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
