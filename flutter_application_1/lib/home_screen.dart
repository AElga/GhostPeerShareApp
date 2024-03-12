import 'package:flutter/material.dart';
import 'welcome_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF0A0E21), 
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Welcome to GhostPeerShare!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 24.0),
                    Text(
                      'GhostPeerShare is a cutting-edge peer-to-peer (P2P) sharing application designed to make the transfer of videos secure, private, and effortless. In an age where digital privacy is paramount, our platform ensures your media is encrypted end-to-end and shared directly between devices without ever touching the cloud. Whether you\'re looking to send family memories, collaborate on creative projects, or share sensitive information, GhostPeerShare provides the tools you need to do so with confidence.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(height: 32.0),
                    Text(
                      'Choose Your Journey:',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8.0),
                    Text(
                      'Send Video: Seamlessly encrypt and send videos to a peer using our state-of-the-art encryption protocols.\n\n'
                      'Receive Video: Receive videos from peers nearby with the assurance that your privacy is protected.\n\n'
                      'Join the GhostPeer Share community today and experience the freedom of secure, decentralized media sharing.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(30.0),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue,
                  padding: EdgeInsets.symmetric(horizontal: 48, vertical: 20),
                  textStyle: TextStyle(fontSize: 16),
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => WelcomeScreen()));
                },
                child: Text('Get Started'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
