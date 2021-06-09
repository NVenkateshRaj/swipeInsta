import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_lock/flutter_app_lock.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:learnanimation/beach/main_screen.dart';
import 'package:learnanimation/color.dart';
import 'package:learnanimation/foods.dart';
import 'package:learnanimation/messgeing.dart';
import 'package:learnanimation/messege/otp_autofill.dart';
import 'package:learnanimation/speech_to_text.dart';
import 'package:learnanimation/swipe_images/swipe_image.dart';
import 'package:learnanimation/tween/tween_animation.dart';

import 'custom_path/custom_path.dart';


final AndroidNotificationChannel androidNotificationChannel=AndroidNotificationChannel("006","Venkat", "Testing Notification",importance: Importance.high,playSound: true);

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin=FlutterLocalNotificationsPlugin();


Future<void> _firebaseMessagingBackgroud(RemoteMessage remoteMessage)async{
  await Firebase.initializeApp();
  print("Message id is ${remoteMessage.messageId}");
}


Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroud);


  await flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()?.createNotificationChannel(androidNotificationChannel);

  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(alert: true,badge: true,sound: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: OTPAutoFill(),
      //home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  TextEditingController controller=TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColor().backGroundColor,
        body: SingleChildScrollView(
          child:Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: GridView.builder(
                    primary: false,
                    itemCount: foodList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder:(context,index){
                      return Container(
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            foodList[index].icon,
                            Text(foodList[index].name)
                          ],
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.green,
          onPressed: (){

          },
          child: Icon(Icons.add,color: Colors.white,),
        ),
      ),
    );
  }
}
/*
Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Flexible(
                child: GridView.builder(
                  primary: false,
                  controller: controller,
                  itemCount: foodList.length,
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        crossAxisSpacing: 4.0,
                        mainAxisSpacing: 4.0
                    ),
                    itemBuilder:(context,index){
                  return Container(
                    margin: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        foodList[index].icon,
                        Text(foodList[index].name)
                      ],
                    ),
                  );
                }),
              )
            ],
          ),
 */