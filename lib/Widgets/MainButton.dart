import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {this.text,
      this.colour = Colors.lightBlueAccent,
      this.onTap,
      @required this.children,
      this.padding =
          const EdgeInsets.only(top: 1, bottom: 10, left: 10, right: 5)});

  final String text;
  final Color colour;
  final Function onTap;
  final List<Widget> children;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: colour,
            side: BorderSide(color: Colors.black, width: 0.2),
            minimumSize: Size(100, 80),
            padding: padding),
        onPressed: onTap,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
