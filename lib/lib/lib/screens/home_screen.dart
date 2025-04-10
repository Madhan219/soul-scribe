import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  final void Function() onMoodTap;
  final void Function() onJournalTap;
  final void Function() onChatTap;
  final void Function() onHistoryTap;

  HomeScreen({
    required this.onMoodTap,
    required this.onJournalTap,
    required this.onChatTap,
    required this.onHistoryTap,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Soul Scribe')),
      body: GridView.count(
        padding: const EdgeInsets.all(16),
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 12,
        children: [
          _buildCard(context, 'Log Mood', Icons.emoji_emotions, onMoodTap),
          _buildCard(context, 'Journal', Icons.book, onJournalTap),
          _buildCard(context, 'Chat', Icons.chat, onChatTap),
          _buildCard(context, 'History', Icons.bar_chart, onHistoryTap),
        ],
      ),
    );
  }

  Widget _buildCard(BuildContext context, String label, IconData icon, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 4,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, size: 48, color: Theme.of(context).colorScheme.secondary),
              SizedBox(height: 12),
              Text(label, style: TextStyle(fontSize: 16)),
            ],
          ),
        ),
      ),
    );
  }
}
