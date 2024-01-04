// ignore_for_file: prefer_const_constructors, unnecessary_null_comparison, non_constant_identifier_names, unused_local_variable, avoid_print, unused_import, prefer_typing_uninitialized_variables, unused_element, unnecessary_new, prefer_collection_literals, curly_braces_in_flow_control_structures, use_build_context_synchronously

import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:insaaf99bareact/Controllers/main_controller.dart';
import 'package:insaaf99bareact/Screens/homepage.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Controllers/notification_controller.dart';
import 'Screens/News_Screens/News_viewPage.dart';
import '../Modal/modal.dart';
import 'Screens/SplashScreen.dart';
import 'themes/function.dart';

Future<void> backgroundHandler(RemoteMessage message) async {
  if (message == null) return;
  navigatorKey.currentState!.push(
    MaterialPageRoute(
      builder: (context) => NewsViewPage(
        NewsID: message.data["post_id"],
        Title: "View Detail",
      ),
    ),
  );
}

final navigatorKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: FirebaseOptions(
              apiKey: "AIzaSyCa7Qa3Yu17IAtLQqKHj5DEoELyfkEsFcE",
              appId: "1:987575769100:android:c6eb634140e80fe82a7629",
              messagingSenderId: "987575769100",
              projectId: "insaaf99-db601"))
      : Firebase.initializeApp();
  FirebaseMessaging.onBackgroundMessage(backgroundHandler);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NotificationService notificationServices = NotificationService();
  var maincontroller = new mainController();
  noti_save() async {
    var dID = await notificationServices.initNotification();
    await maincontroller.fnGetDeviceID(context);
    if (maincontroller.deviceID_list.isEmpty &&
        maincontroller.deviceID_list.contains(dID) != true) {
      await maincontroller.save_device_id(context, dID);
    } else {
      print("alread Exits Device ID ");
    }
  }

  @override
  void initState() {
    noti_save();
    super.initState();
  }

  var DeviceID;
  deviceId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      DeviceID = (prefs.getString('userDeviceId'));
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
