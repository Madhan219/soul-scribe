import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  // Dummy data for now
  final List<Map<String, dynamic>> moodLogs = [
    {'date': 'Apr 10', 'mood': 'Happy'},
    {'date': 'Apr 9', 'mood': 'Sad'},
    {'date': 'Apr 8', 'mood': 'Calm'},
    {'date': 'Apr 7', 'mood': 'Angry'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Mood History')),
      body: ListView.builder(
        itemCount: moodLogs.length,
        itemBuilder: (context, index) {
          final log = moodLogs[index];
          return ListTile(
            leading: Icon(Icons.circle, color: _moodColor(log['mood'])),
            title: Text(log['mood']),
            subtitle: Text(log['date']),
          );
        },
      ),
    );
  }

  Color _moodColor(String mood) {
    switch (mood) {
      case 'Happy':
        return Colors.yellow;
      case 'Sad':
        return Colors.blue;
      case 'Angry':
        return Colors.red;
      case 'Calm':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }
}
