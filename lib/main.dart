import 'dart:async';
import 'package:CIFET/Ui/Notification/notifications.dart';
import 'package:CIFET/styles/apptheme.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Helpers/Helper.dart';
import 'Ui/Home/Home.dart';
import 'homepage.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Helper.sharedPreferences =await SharedPreferences.getInstance();
  print(Helper.GetCurrentTextDirection());


  runApp(
     MyApp()
  );
}    //theme: appTheme.apptheme,


class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Main',
      theme: appTheme.apptheme,
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
      navigatorKey: Helper.materialKey,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {



  @override
  void initState() {
    super.initState();
    FirebaseMessaging.instance
        .getInitialMessage()
        .then((val) {
      if (val != null) {
        Navigator.push(context, MaterialPageRoute(builder: (context) {
          return Notifications("Notifications", "Notifications");
        },));
      }
      });




















    Timer(
        Duration(seconds: 4),
        () async{
          Helper.HelperInit(context);
         // Helper.Dic=await Helper.getJson();
         await FirebaseMessaging.instance.subscribeToTopic("allDevices");
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return Home();
          }));




        });
  }

  @override
  Widget build(BuildContext context) {

    return new Scaffold(
        backgroundColor: Colors.white,
        body: Center(child:Container(
            color: Colors.white, child: Image.asset("assets/logo.jpeg"))));

//    return Container(
//        color: Colors.white, child: Image.asset("assets/logo.jpeg"));
  }
}
