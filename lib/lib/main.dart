import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

import 'screens/home_screen.dart';
import 'screens/mood_picker.dart';
import 'screens/journal_screen.dart';
import 'screens/chat_screen.dart';
import 'screens/history_screen.dart';

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
      ),
      darkTheme: ThemeData.dark(),
      home: MainRouter(),
    );
  }
}

class MainRouter extends StatefulWidget {
  @override
  State<MainRouter> createState() => _MainRouterState();
}

class _MainRouterState extends State<MainRouter> {
  @override
  Widget build(BuildContext context) {
    return HomeScreen(
      onMoodTap: () async {
        final mood = await Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => MoodPickerScreen()),
        );
        if (mood != null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('You selected: $mood')));
        }
      },
      onJournalTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => JournalScreen()));
      },
      onChatTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => ChatScreen()));
      },
      onHistoryTap: () {
        Navigator.push(context, MaterialPageRoute(builder: (_) => HistoryScreen()));
      },
    );
  }
}
