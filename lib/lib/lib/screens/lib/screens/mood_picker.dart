import 'package:flutter/material.dart';

class MoodPickerScreen extends StatelessWidget {
  final List<Map<String, dynamic>> moods = [
    {'label': 'Happy', 'icon': Icons.sentiment_satisfied, 'color': Colors.yellow},
    {'label': 'Sad', 'icon': Icons.sentiment_dissatisfied, 'color': Colors.blue},
    {'label': 'Angry', 'icon': Icons.sentiment_very_dissatisfied, 'color': Colors.red},
    {'label': 'Calm', 'icon': Icons.self_improvement, 'color': Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Pick Your Mood')),
      body: ListView.builder(
        itemCount: moods.length,
        itemBuilder: (context, index) {
          final mood = moods[index];
          return Card(
            color: mood['color'].withOpacity(0.2),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: ListTile(
              leading: Icon(mood['icon'], color: mood['color']),
              title: Text(mood['label']),
              onTap: () {
                Navigator.pop(context, mood['label']);
              },
            ),
          );
        },
      ),
    );
  }
}
