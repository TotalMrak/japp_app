import 'package:flutter/material.dart';
import '../Models/DataProv.dart';
import 'package:provider/provider.dart';

class RandButton extends StatelessWidget {
  const RandButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Ink(
      decoration: ShapeDecoration(
          color: Colors.amberAccent,
          shape:
              CircleBorder(side: BorderSide(width: 0.7, color: Colors.blue))),
      child: IconButton(
        icon: Icon(Icons.alt_route),
        onPressed: () {
          Provider.of<MainData>(context, listen: false).randomChars();
        },
        color: Colors.white,
      ),
    );
  }
}
