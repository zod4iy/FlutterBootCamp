import 'package:flutter/material.dart';

// The main function is the starting point for all our Flutter apps
void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('I am rich'),
          backgroundColor: Colors.blueGrey[900],
        ),
        backgroundColor: Colors.blueGrey,
        body: const Center(
          child: Image(
            image: NetworkImage(
                'https://cdn.pixabay.com/photo/2015/04/23/22/00/tree-736885__480.jpg'),
          ),
        ),
      ),
    ),
  );
}
