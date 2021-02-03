import 'package:flutter/material.dart';

class MainButton extends StatelessWidget {
  MainButton(
      {this.text,
      this.colour = Colors.lightBlueAccent,
      this.ontap,
      this.fontsize = 50,
      this.buttonheight = 80});

  final String text;
  final Color colour;
  final Function ontap;
  final double fontsize;
  final double buttonheight;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: Material(
        elevation: 5.0,
        color: colour,
        borderRadius: BorderRadius.circular(30.0),
        child: MaterialButton(
          onPressed: ontap,
          minWidth: 200.0,
          height: buttonheight,
          child: Text(
            text,
            style: TextStyle(
              fontFamily: 'YanoneKaffeesatz',
              fontSize: fontsize,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
