import 'package:flutter/material.dart';
//import 'discover_devices_screen.dart';

class QuickSendScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quick Send'),
        backgroundColor: Color(0xFF0A0E21), 
      ),
      backgroundColor: Color(0xFF0A0E21), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Quick Send Functionality to be implemented',
              style: TextStyle(color: Colors.white),
            ),
            ElevatedButton(
              onPressed: () {
                //Navigator.of(context).push(MaterialPageRoute(builder: (_) => DiscoverDevicesScreen()));
              },
              child: Text('Discover Devices'),
            ),
          ],
        ),
      ),
    );
  }
}
