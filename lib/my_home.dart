import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String _message = 'Chưa có thông báo nào';

  @override
  void initState() {
    super.initState();

    FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.instance.getToken().then((token) {
      print('📱 FCM Token: $token');
    });

    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _message =
        '📨 Foreground: ${message.notification?.title} - ${message.notification?.body}';
      });
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      setState(() {
        _message =
        '🟢 Opened from notification: ${message.notification?.title}';
      });
    });

    FirebaseMessaging.instance.getInitialMessage().then((message) {
      if (message != null) {
        setState(() {
          _message =
          '🚪 Opened from terminated push: ${message.notification?.title}';
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Firebase Messaging'),
      ),
      body: Center(
        child: Text(_message),
      ),
    );
  }
}
