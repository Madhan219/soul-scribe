import 'package:flutter/material.dart';

class JournalScreen extends StatefulWidget {
  @override
  _JournalScreenState createState() => _JournalScreenState();
}

class _JournalScreenState extends State<JournalScreen> {
  final TextEditingController _controller = TextEditingController();
  String savedEntry = '';

  void _saveEntry() {
    setState(() {
      savedEntry = _controller.text;
      _controller.clear();
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Journal entry saved!")),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Write Your Journal")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              maxLines: 8,
              decoration: InputDecoration(
                hintText: "Write your thoughts here...",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _saveEntry,
              icon: Icon(Icons.save),
              label: Text("Save Entry"),
            ),
            if (savedEntry.isNotEmpty) ...[
              Divider(height: 40),
              Text("Last Saved Entry:", style: TextStyle(fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text(savedEntry),
            ]
          ],
        ),
      ),
    );
  }
}
