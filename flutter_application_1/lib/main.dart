import 'package:flutter/material.dart';
import 'home_screen.dart';

void main() {
  runApp(const MyEncryptionApp());
}

class MyEncryptionApp extends StatelessWidget {
  const MyEncryptionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'GhostPeerShare',
      theme: ThemeData.dark().copyWith(
        primaryColor: const Color(0xFF0A0E21),
        scaffoldBackgroundColor: const Color(0xFF0A0E21),
      ),
      home: const HomeScreen(),
      routes: const {},
    );
  }
}
