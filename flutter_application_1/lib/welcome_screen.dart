import 'package:flutter/material.dart';
import 'sending_options_screen.dart';
import 'configuration_screen.dart';
import 'receive_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: const Color(0xFF0A0E21),
        elevation: 0,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ConfigurationScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(flex: 2),
            const Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16.0),
            const Text(
              'What Would you Like to do?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            ElevatedButton.icon(
              icon: const Icon(Icons.send),
              label: const Text('SEND VIDEO'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const SendingOptionsScreen()));
              },
            ),
            const SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: const Icon(Icons.download),
              label: const Text('RECEIVE VIDEO'),
              style: ElevatedButton.styleFrom(
                foregroundColor: Colors.white, backgroundColor: Colors.blue,
                padding: const EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const ReceiveScreen()));
              },
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
