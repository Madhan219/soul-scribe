import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Soul Scribe',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Soul Scribe'),
        ),
        body: Center(
          child: Text('Welcome to Soul Scribe!'),
        ),
      ),
    );
  }
}
