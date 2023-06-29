import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:smart_intruder_alert_system/login.dart';
import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelKey: 'Basic_Channel',
          channelName: 'Basic Notification',
          channelDescription: 'channel Description'),
    ],
    debug: true,
  );
  runApp(Main());
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'hello',
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
