import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await _initNotifications();
  runApp(SoulScribeApp());
}

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

Future<void> _initNotifications() async {
  const AndroidInitializationSettings androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
  const InitializationSettings initSettings = InitializationSettings(android: androidSettings);
  await flutterLocalNotificationsPlugin.initialize(initSettings);

  const AndroidNotificationDetails androidDetails = AndroidNotificationDetails(
    'daily_reminder',
    'Daily Reminders',
    channelDescription: 'Daily journal and mood check reminder',
    importance: Importance.high,
    priority: Priority.high,
  );

  const NotificationDetails platformDetails = NotificationDetails(android: androidDetails);

  await flutterLocalNotificationsPlugin.periodicallyShow(
    0,
    'How are you feeling today?',
    'Tap to log your mood or journal your thoughts.',
    RepeatInterval.daily,
    platformDetails,
    androidAllowWhileIdle: true,
  );
}

class SoulScribeApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Soul Scribe',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.indigo,
        fontFamily: 'Nunito',
        scaffoldBackgroundColor: Colors.grey[100],
      ),
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(title: Text('Soul Scribe')),
        body: Center(child: Text('Welcome to Soul Scribe!')),
      ),
    );
  }
}
