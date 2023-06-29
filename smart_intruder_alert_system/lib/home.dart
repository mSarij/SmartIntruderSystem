import 'dart:async';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

final databaseRef = FirebaseDatabase.instance.ref();

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.user});
  String user;
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  _HomeScreenState() {
    loadImage();
    // downloadURL('Image.jpg');
  }
  String image = '';

  @override
  void initState() {
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) {
      if (!isAllowed) {
        AwesomeNotifications().requestPermissionToSendNotifications();
      }
    });
    super.initState();
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: 'Basic_Channel',
          title: 'Warning',
          body: 'A new intruder captured.'),
    );
  }

  void loadImage() async {
    DatabaseReference starCountRef =
        FirebaseDatabase.instance.ref().child('image');
    starCountRef.onValue.listen((DatabaseEvent event) {
      setState(() {
        image = event.snapshot.value.toString();
      });
      triggerNotification();
      print(image);
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text('Hi ${widget.user}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Center(
              child: Image(
                image: AssetImage('asserts/cloud.png'),
                width: 150,
              ),
            ),
            const SizedBox(height: 20),
            const Text('Connected',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                textAlign: TextAlign.left),
            const SizedBox(height: 20),
            const Text('Hi ',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
                textAlign: TextAlign.left),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text('see your restricted area in hear.'),
                Image(
                  image: image == ''
                      ? const AssetImage('asserts/intruder.png')
                      : NetworkImage(image) as ImageProvider,
                  // image: AssetImage('asserts/intruder.png'),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
