import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.teal,
        body: SafeArea(
          child: Column(
            children: [
              const CircleAvatar(
                radius: 50.0,
                backgroundColor: Colors.white,
                foregroundImage: AssetImage('images/userMale.png')
              ),
              const Text(
                'Alexandr Kurylenko',
                style: TextStyle(
                  fontFamily: 'Pacifico',
                  fontSize: 34.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),
              ),
              Text(
                'iOS/Flutter DEVELOPER',
                style: TextStyle(
                    fontFamily: 'SourceSansPro',
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.teal.shade100,
                    letterSpacing: 2.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}