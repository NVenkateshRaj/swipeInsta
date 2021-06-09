import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learnanimation/main.dart';

class MessageExample extends StatefulWidget{
  _MessageState createState()=>_MessageState();
}

class _MessageState extends State<MessageExample>{


   FirebaseMessaging firebaseMessaging;

   @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.onMessage.listen((RemoteMessage remoteMessage){
      RemoteNotification remoteNotification=remoteMessage.notification;
      AndroidNotification androidNotification=remoteMessage.notification?.android;
      if(remoteNotification!=null && androidNotification!=null){
        flutterLocalNotificationsPlugin.show(remoteNotification.hashCode, remoteNotification.title, remoteNotification.body, NotificationDetails(
          android: AndroidNotificationDetails(
              androidNotificationChannel.id,
            androidNotificationChannel.name,
              androidNotificationChannel.description,
            color: Colors.green,
            playSound: true,
            icon: "@mipmap/ic_launcher"
          )
        ));
      
      }
    });


    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage remoteMessage){
      print("Used to open the alert dialog when the user click the notification");
      RemoteNotification remoteNotification=remoteMessage.notification;
      AndroidNotification androidNotification=remoteMessage.notification?.android;
      if(remoteNotification!=null && androidNotification!=null){
        showDialog(context: context, builder: (_){
          return AlertDialog(
            title: Text(remoteNotification.title),
            content:SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(remoteNotification.body)
                ],
              ),
            ),
          );
        });
      }
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Implementing Push Notification"),),
      body: Container(
        child: Center(
          child: Text("Notification Testing"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add,color: Colors.white,),
        backgroundColor: Colors.green,
        onPressed: (){
          callLocalNotification();
        },
      )
    );
  }

   callLocalNotification(){
     flutterLocalNotificationsPlugin.show(0, "Local Notification", "Testing Local Notification", NotificationDetails(
       android:AndroidNotificationDetails(
           androidNotificationChannel.id,
           androidNotificationChannel.name,
           androidNotificationChannel.description,
           importance: Importance.high,
           color: Colors.green,
           playSound: true,
           icon: "@mipmap/ic_launcher"
       )
     ));
   }

}