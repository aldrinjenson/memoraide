// ignore: depend_on_referenced_packages
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void createNotif(Map data) {
  print(data);
  print(data["body"]);
  print(data['title']);
  print("creating notif");
  AwesomeNotifications()
      .createNotification(
          content: NotificationContent(
              id: 10,
              channelKey: 'basic_channel',
              title: data['title'],
              body: data['body']))
      .then((value) => print("notif made"))
      .catchError((e) => print("error in creating notif: $e"));
}

void createScheduledNotification(Map data) async {
  print("Creating shceduled notification");
  DateTime scheduleTime = data['scheduleTime'];
  print(data);
  await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: 12,
        channelKey: 'basic_channel',
        title: data['title'],
        body: data['body'],
        wakeUpScreen: true,
        category: NotificationCategory.Reminder,
        // notificationLayout: NotificationLayout.BigPicture,
        // bigPicture: 'asset://assets/images/delivery.jpeg',
        payload: {'uuid': 'uuid-test'},
        // autoDismissible: false,
      ),
      schedule: NotificationCalendar.fromDate(date: scheduleTime));
}

Future<dynamic> callBackendAPI(dynamic params) async {
  String? BackendAPI = dotenv.env['BACKEND_URI'];

  Uri uri = Uri.parse('$BackendAPI/movieFromSnaps');
  String jsonData = jsonEncode({"params": params});

  try {
    final response = await http.post(uri,
        headers: {'Content-Type': 'application/json'}, body: jsonData);
    print(response.body);
    // var decodedResponse = jsonDecode(utf8.decode(response.bodyBytes)) as Map;
    // print(decodedResponse);

    if (response.statusCode == 200) {
      return response.body;
    } else {
      // handle the API error
      print('API error: ${response.statusCode}');
    }
    return response.body;
  } catch (e) {
    print('Network error: $e');
    return "Error";
  }
}
