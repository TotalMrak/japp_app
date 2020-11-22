import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon({this.icon, this.colour = Colors.lightBlueAccent});

  final IconData icon;
  final Color colour;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: CircleAvatar(
        backgroundColor: colour,
        radius: 17.0,
        child: Icon(
          icon,
          size: 17.0,
          color: Colors.white60,
        ),
      ),
    );
  }
}
