import 'package:flutter/material.dart';

class ConfigurationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configuration Page'),
        backgroundColor: Color(0xFF0A0E21),
      ),
      backgroundColor: Color(0xFF0A0E21),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('System Info', style: TextStyle(color: Colors.white)),
              onTap: () {
                // need to navigate to the System Info screen here 
              },
            ),
            ListTile(
              title: Text('Preferences', style: TextStyle(color: Colors.white)),
              onTap: () {
                // need to navigate to the Preferences screen here 
              },
            ),
            ListTile(
              title: Text('Advertising', style: TextStyle(color: Colors.white)),
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
