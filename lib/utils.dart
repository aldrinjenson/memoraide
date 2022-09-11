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
