import 'package:flutter/material.dart';
import 'sending_options_screen.dart';
import 'configuration_screen.dart'; 

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21),
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        elevation: 0, 
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => ConfigurationScreen()));
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),
            Text(
              'Welcome!',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'What Would you Like to do?',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            ElevatedButton.icon(
              icon: Icon(Icons.send),
              label: Text('SEND VIDEO'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, 
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => SendingOptionsScreen()));
              },
            ),
            SizedBox(height: 16.0),
            ElevatedButton.icon(
              icon: Icon(Icons.download),
              label: Text('RECEIVE VIDEO'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, 
                onPrimary: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 36, vertical: 16),
              ),
              onPressed: () {
                // need to implement navigation to receive video screen here 
              },
            ),
            Spacer(flex: 2),
          ],
        ),
      ),
    );
  }
}
