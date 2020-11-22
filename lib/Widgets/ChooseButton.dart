import 'package:flutter/material.dart';

class ChooseButton extends StatelessWidget {
  ChooseButton({this.line, this.checkPressed, this.onTap, this.colorActive});

  final String line;
  final bool checkPressed;
  final Function onTap;
  final Color colorActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
      child: Material(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(5),
          topRight: Radius.circular(5.0),
        ),
        elevation: checkPressed ? 1 : 5,
        color: checkPressed ? colorActive : Colors.blueGrey,
        child: MaterialButton(
          onPressed: onTap,
          minWidth: 140,
          height: 60,
          child: Center(
            child: Text(
              line,
              style: TextStyle(
                fontFamily: 'YanoneKaffeesatz',
                fontSize: 45,
                color: checkPressed ? Colors.black54 : Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
