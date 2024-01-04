// ignore_for_file: unused_local_variable, avoid_print, unused_import, unnecessary_null_comparison, prefer_const_constructors, missing_required_param, prefer_const_literals_to_create_immutables, unnecessary_new, prefer_collection_literals, non_constant_identifier_names, prefer_typing_uninitialized_variables

import 'dart:convert';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:insaaf99bareact/main.dart';

import 'package:shared_preferences/shared_preferences.dart';
import '../Modal/modal.dart';
import '../Screens/News_Screens/News_viewPage.dart';

class NotificationService {
  final messaging = FirebaseMessaging.instance;

  final _androidChannel = const AndroidNotificationChannel(
    "insaafnotif99",
    "pushnotificationappchannel",
    description: "This channel is used for important notification",
    importance: Importance.defaultImportance,
  );

  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  void requestNotification() async {
    NotificationSettings settings = await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("User granted permission");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print('user granted previsional permission');
    } else {
      print('user granted previsional permission');
    }
  }

  onSelectNotification(RemoteMessage message) async {
    if (message == null) return;
    print("Body: ${message.notification?.body}");
    print("===========================================================");
    Navigator.of(navigatorKey.currentContext!).push(MaterialPageRoute(
        builder: (context) => NewsViewPage(
              NewsID: message.data["post_id"],
              Title: "View Detail",
            )));
  }

  Future initLocalNotification(mes) async {
    var android = const AndroidInitializationSettings('@mipmap/ic_launcher');
    var settings = InitializationSettings(android: android);
    await _localNotifications.initialize(settings,
        onDidReceiveNotificationResponse: (payload) {
      onSelectNotification(mes);
    });

    // const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    // const settings = InitializationSettings(android: android);

    // await _localNotifications.initialize(settings,
    //     onDidReceiveNotificationResponse: (payload) {
    //   final message = RemoteMessage.fromMap(jsonDecode(payload as String));
    //   FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);

    //   // when app is open ============================================
    //   FirebaseMessaging.onMessage.listen((message) {
    //     final notification = message.notification;

    //     _localNotifications.show(
    //         notification.hashCode,
    //         notification?.title,
    //         notification?.body,
    //         NotificationDetails(
    //             android: AndroidNotificationDetails(
    //                 _androidChannel.id, _androidChannel.name,
    //                 channelDescription: _androidChannel.description,
    //                 icon: "@mipmap/ic_launcher")),
    //         payload: jsonEncode(message.toMap()));
    //   });
    //   handleBackgroundMessage(message);
    // });
    // final platform = _localNotifications.resolvePlatformSpecificImplementation<
    //     AndroidFlutterLocalNotificationsPlugin>();

    // await platform?.createNotificationChannel(_androidChannel);
  }

///////// ======================================================================
  Future initPushNotification() async {
    const android = AndroidInitializationSettings('@mipmap/ic_launcher');
    const settings = InitializationSettings(android: android);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
            alert: true, badge: true, sound: true);
    FirebaseMessaging.instance
        .getInitialMessage()
        .then(handleBackgroundMessage);
    // for when app is terminated OR closed
    FirebaseMessaging.onMessageOpenedApp.listen(handleBackgroundMessage);
    // for when app is open
    FirebaseMessaging.onMessage.listen((message) {
      final notification = message.notification;
      if (notification == null) return;
      _localNotifications.show(
          notification.hashCode,
          notification.title,
          notification.body,
          NotificationDetails(
              android: AndroidNotificationDetails(
                  _androidChannel.id, _androidChannel.name,
                  channelDescription: _androidChannel.description,
                  icon: "@mipmap/ic_launcher")),
          payload: jsonEncode(message.toMap()));

      initLocalNotification(message);
    });
  } //////===================================================ss===========

/////// check for notification  +++++++++++++++++++++++++++++++++++++++++++++++

  Future initNotification() async {
    await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        criticalAlert: true,
        provisional: true,
        sound: true);
    var fCtoken = await messaging.getToken();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('userDeviceId', "$fCtoken");
    initPushNotification();
    return "$fCtoken";
  } ///////====================================================================

  ///// this is handle the back groynt notification

  Future<void> handleBackgroundMessage(RemoteMessage? message) async {
    if (message == null) return;
    print("Title: ${message.notification?.title}");
    print("Body: ${message.notification?.body}");

    print("id: ${message.data["post_id"]}");

    navigatorKey.currentState!.push(
      MaterialPageRoute(
        builder: (context) => NewsViewPage(
          NewsID: message.data["post_id"],
          Title: "View Detail",
        ),
      ),
    );
  }
} //////   Class Close

