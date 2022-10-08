

import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:local_notification/main.dart';
import 'package:timezone/timezone.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

void shwonotification()async{
  AndroidNotificationDetails androidDetails= const AndroidNotificationDetails(
"Notification_name",
"Notification_Channel",

priority:Priority.max,
importance: Importance.max,

  );

  DarwinNotificationDetails  iosdetails= const DarwinNotificationDetails(
    presentAlert: true,
    presentBadge: true,
    presentSound: true,

  );
 DateTime time=DateTime.now().add(Duration(seconds: 1
 ));
  NotificationDetails notiDetels=NotificationDetails(android: androidDetails,iOS: iosdetails);

   //await notification.show( 0, "This is Title", "This is your Discrivetion",time, notiDetels);

   //await notification.schedule( 0, "This is Title", "This is your Discrivetion",time, notiDetels);
   await notification.zonedSchedule( 0, "This is Title", "This is your Discrivetion",
  TZDateTime.from(time, local),
    notiDetels,
    uiLocalNotificationDateInterpretation: UILocalNotificationDateInterpretation.wallClockTime,
   androidAllowWhileIdle: true,
    );
}

  @override



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("This is App Bar"),),
    floatingActionButton: FloatingActionButton(onPressed: shwonotification,
        child: Icon(Icons.notifications),
    ),
    );
    
  }
}