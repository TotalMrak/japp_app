import 'package:flutter/material.dart';

class CircleIcon extends StatelessWidget {
  CircleIcon({this.icon, this.colour = Colors.lightBlueAccent, this.onTap});

  final IconData icon;
  final Color colour;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
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
