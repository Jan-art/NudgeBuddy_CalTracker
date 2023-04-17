import 'package:NudgeBuddy/controllers/auth.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:timezone/timezone.dart' as tz;

// LOCAL NOTIFICATIONS SERVICE, USED IN THE NOTIFICATION CONTROLLER CLASS TO SEND NOTIFICATIONS TO THE USER AT A SPECIFIC TIME AND DATE AND REPEAT IT IF NEEDED.
//==================================================================================================================================================================
class LocalNotificationsService {
  final authCont = Get.put(AuthController());
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  //INITIALIZE LOCAL NOTIFICATIONS
  void initializeLocalNotifications() async {
    var androidInitialize =
        const AndroidInitializationSettings('@mipmap/launcher_icon');
    var iosInitialize = const DarwinInitializationSettings();
    var initializeSettings =
        InitializationSettings(android: androidInitialize, iOS: iosInitialize);
    flutterLocalNotificationsPlugin
        .initialize(initializeSettings)
        .then((value) => print("Local notifications initialized"));
  }

  //NOTIFY BY WEEK DAY
  Future<void> showNotification(
    DateTime date,
    int id,
    String title,
    String body,
    bool isRepeat,
  ) async {
    var androidDetails = const AndroidNotificationDetails(
        "channel_id", "channel_name",
        importance: Importance.max, priority: Priority.max);
    var iosDetails = const DarwinNotificationDetails();
    var generalNotificationsDetails =
        NotificationDetails(android: androidDetails, iOS: iosDetails);
    
    //REPEAT LOCAL NOTIFICATION
    if (isRepeat) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        id,
        title,
        body,
        tz.TZDateTime(tz.getLocation(authCont.defaultTimeZone.value), date.year,
            date.month, date.day, date.hour, date.minute),
        generalNotificationsDetails,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: id == 98
            ? DateTimeComponents.dayOfWeekAndTime
            : DateTimeComponents.time,
        androidAllowWhileIdle: true,
      );
      print(date);
    } else {
      await flutterLocalNotificationsPlugin.show(
          id, title, body, generalNotificationsDetails);
    }
  }
  
  //CANCEL NOTIFICATION
  Future<void> cancelTestNotification(int id) async {
    await flutterLocalNotificationsPlugin.cancel(id);
  }
  
  //DELETE NOTIFICATION
  Future<void> deleteNotification(int notifyID) async {
    await flutterLocalNotificationsPlugin.cancel(notifyID);
  }

  //PERMISSION FOR NOTIFICATIONS ON ANDROID AND IOS DEVICE "Settings"
  Future<void> requestNotificationPermissions() async {
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      "channel_id",
      "channel_name",
    );
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }
}
