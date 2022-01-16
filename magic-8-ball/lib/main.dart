import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: BallPage(),
    ),
  );
}

class BallPage extends StatelessWidget {
  const BallPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask Me Anything'),
        backgroundColor: Colors.blue.shade900,
      ),
      backgroundColor: Colors.blue,
      body: Ball(),
    );
  }
}

class Ball extends StatefulWidget {
  const Ball({Key? key}) : super(key: key);

  @override
  _BallState createState() => _BallState();
}

class _BallState extends State<Ball> {
  int ballNumber = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.all(16.0),
        child: TextButton(
          onPressed: () {
            onBallPressed();
          },
          child: Image.asset('images/ball$ballNumber.png'),
        ),
      ),
    );
  }

  void onBallPressed() {
    setState(() {
      ballNumber = generateRandomBallNumber();
    });
  }

  int generateRandomBallNumber() {
    return Random().nextInt(5) + 1;
  }
}
