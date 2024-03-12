import 'package:flutter/material.dart';
import 'quick_send_screen.dart';
import 'advanced_send_screen.dart';

class SendingOptionsScreen extends StatelessWidget {
  const SendingOptionsScreen({super.key});

  void navigateToQuickSend(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const QuickSendScreen()));
  }

  void navigateToAdvancedSend(BuildContext context) {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => const AdvancedSendScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        title: const Text('Sending Options'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 120.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Text(
              'Sending Options',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 48),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () => navigateToQuickSend(context),
              child: const Text(
                'Quick Send',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              ),
              onPressed: () => navigateToAdvancedSend(context),
              child: const Text(
                'Advanced Send',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
