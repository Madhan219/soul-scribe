import 'package:flutter/material.dart';

class MoodPicker extends StatefulWidget {
  @override
  _MoodPickerState createState() => _MoodPickerState();
}

class _MoodPickerState extends State<MoodPicker> {
  String? selectedMood;

  final moods = ["Happy", "Sad", "Angry", "Excited", "Calm", "Anxious"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pick Your Mood")),
      body: ListView.builder(
        itemCount: moods.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(moods[index]),
            trailing: selectedMood == moods[index]
                ? Icon(Icons.check_circle, color: Colors.green)
                : null,
            onTap: () {
              setState(() {
                selectedMood = moods[index];
              });
            },
          );
        },
      ),
      floatingActionButton: selectedMood != null
          ? FloatingActionButton.extended(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Mood Saved: $selectedMood")),
                );
                Navigator.pop(context);
              },
              label: Text("Save Mood"),
              icon: Icon(Icons.save),
            )
          : null,
    );
  }
}
