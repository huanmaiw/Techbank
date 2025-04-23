import 'package:flutter/material.dart';

class RegisterNowScreen extends StatelessWidget {
  const RegisterNowScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: (){

            }, child: const Text("Đăng kí ngay")),
            const SizedBox(height: 20),
            const Text(
              'Waiting',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
