import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  final List<Map<String, String>> moodHistory = [
    {"date": "Apr 9", "mood": "Happy"},
    {"date": "Apr 8", "mood": "Sad"},
    {"date": "Apr 7", "mood": "Calm"},
    // You can later connect this to a database or local storage.
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Mood History")),
      body: ListView.builder(
        itemCount: moodHistory.length,
        itemBuilder: (context, index) {
          final entry = moodHistory[index];
          return ListTile(
            leading: Icon(Icons.calendar_today),
            title: Text("${entry['mood']}"),
            subtitle: Text("${entry['date']}"),
          );
        },
      ),
    );
  }
}
