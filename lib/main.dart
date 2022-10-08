import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification/homepage.dart';
import 'package:timezone/standalone.dart';

FlutterLocalNotificationsPlugin notification=FlutterLocalNotificationsPlugin();
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  initializeTimeZone();
  AndroidInitializationSettings androidsettings= const AndroidInitializationSettings("@mipmap/ic_launcher");
  DarwinInitializationSettings iosSettings=const DarwinInitializationSettings(
    requestAlertPermission: true,
    requestSoundPermission: true,
    requestBadgePermission: true,
   requestCriticalPermission: true,
  );

  InitializationSettings initializationSettings= InitializationSettings(
    android: androidsettings,
    iOS: iosSettings
  );

  bool? initialize= await notification.initialize(initializationSettings);

  
  log("Notification:- ${initialize}");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

