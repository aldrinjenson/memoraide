import 'dart:io';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:memoria/utils.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter/material.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:memoria/screens/authenticate/sign_in.dart';
import 'package:memoria/screens/authenticate/sign_up.dart';
import 'package:memoria/screens/home/faceRecog.dart';
import 'package:memoria/screens/home/face_profile.dart';
import 'package:memoria/screens/home/face_search.dart';
import 'package:memoria/screens/home/geolocation.dart';
import 'package:memoria/screens/home/home.dart';
import 'package:memoria/screens/home/journal.dart';
import 'package:memoria/screens/home/reminders.dart';
import 'package:memoria/screens/snapshots_page.dart';
import 'package:memoria/screens/wrapper.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  print("Handling a background message: ${message.messageId}");
  createNotif(message.data);
  AwesomeNotifications().createNotificationFromJsonData(message.data);
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: 'basic_tests',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white,
          importance: NotificationImportance.High),
    ],
  );
  AwesomeNotifications().isNotificationAllowed().then((allowed) {
    if (!allowed) {
      AwesomeNotifications().requestPermissionToSendNotifications();
    } else {
      print("Notification permissions received");
    }
  });

  AwesomeNotifications().actionStream.listen((event) {
    print("event recieved");
    print(event.toMap().toString());
  });

  await Permission.camera.request();
  await Permission.microphone.request();

  if (Platform.isAndroid) {
    await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
  }

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  FirebaseAnalytics.instance;
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    print('User granted notification permission');
  } else if (settings.authorizationStatus == AuthorizationStatus.provisional) {
    print('User granted provisional permission');
  } else {
    print('User declined or has not accepted notification permission');
  }
  final fcmToken = await FirebaseMessaging.instance.getToken();
  print("fcmToken = $fcmToken");
  FirebaseMessaging.instance.onTokenRefresh.listen((fcmToken) {
    print("FCM token refreshed: $fcmToken");
  }).onError((err) {
    print("Error in refreshing fcmtoken: $err");
  });

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Got a message whilst in the foreground!');
    print('Message data: ${message.data}');
    createNotif(message.data);
    if (message.notification != null) {
      print('Message also contained a notification: ${message.notification}');
    }
  });

  runApp(
    MaterialApp(
      theme:
          ThemeData(fontFamily: 'Jost', primaryColor: const Color(0XFF0979FD)),
      initialRoute: '/',
      // home: FirebaseAuth.instance.currentUser != null ? Home() : Authenticate(),
      routes: {
        '/': (context) => const Wrapper(),
        '/home': (context) => const Home(),
        '/reminders': (context) => const Reminders(),
        '/signup': (context) => const SignUp(),
        '/signin': (context) => const SignIn(),
        '/geolocation': (context) => const Geolocation(),
        '/snapshots': (context) => const Snapshots(),
        '/faces': (context) => Faces(),
        '/facesearch': (context) => FaceSearch(),
        '/faceProfile': (context) => const FaceProfile(pName: 'Sharat'),
        '/journal': (context) => const Journal(),
      },
    ),
  );
}
