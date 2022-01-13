import 'package:flutter/material.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I am poor'),
          backgroundColor: Colors.green[900],
        ),
        body: const Center(
            child: Image(
              image: AssetImage('images/christmas.png'),
              height: 400,
              width: 150,
            ),
        ),
        backgroundColor: Colors.green[200],
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
