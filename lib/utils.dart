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
