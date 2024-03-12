import 'package:flutter/material.dart';
import 'home_screen.dart';


void main() {
  runApp(MyEncryptionApp());
}

class MyEncryptionApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GhostPeerShare',
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
      ),
      home: HomeScreen(),
      routes: {

      },
    );
  }
}