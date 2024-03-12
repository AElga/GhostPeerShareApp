import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  const ConfigurationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configuration Page'),
        backgroundColor: const Color(0xFF0A0E21),
      ),
      backgroundColor: const Color(0xFF0A0E21),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: const Text('System Info', style: TextStyle(color: Colors.white)),
              onTap: () {
                // need to navigate to the System Info screen here
              },
            ),
            ListTile(
              title: const Text('Preferences', style: TextStyle(color: Colors.white)),
              onTap: () {
                // need to navigate to the Preferences screen here
              },
            ),
            ListTile(
              title: const Text('Advertising', style: TextStyle(color: Colors.white)),
              onTap: () {
                // need to navigate to the Advertising options screen here
              },
            ),
            // need to add more configuration options if needed here
          ],
        ),
      ),
    );
  }
}
