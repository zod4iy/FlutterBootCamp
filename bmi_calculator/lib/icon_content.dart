import 'package:flutter/material.dart';

const iconContentTextColor = Color(0xFF8D8E98);

class IconContent extends StatelessWidget {
  const IconContent({Key? key, required this.icon, required this.text})
      : super(key: key);

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        const SizedBox(
          height: 15.0,
        ),
        Text(
          text,
          style: const TextStyle(fontSize: 18.0, color: iconContentTextColor),
        ),
      ],
    );
  }
}