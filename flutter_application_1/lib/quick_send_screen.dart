import 'package:flutter/material.dart';

class QuickSendScreen extends StatelessWidget {
  const QuickSendScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quick Send'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'Quick Send Functionality to be implemented',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
              },
              child: const Text('Discover Devices'),
            ),
          ],
        ),
      ),
    );
  }
}
