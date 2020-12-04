import 'package:flutter/material.dart';
import '../Models/DataProv.dart';
import 'package:provider/provider.dart';

class RandButton extends StatelessWidget {
  const RandButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: MaterialButton(
        onPressed: () {
          Provider.of<MainData>(context, listen: false).randomChars();
        },
        height: 10,
        color: Colors.deepOrangeAccent[200],
        padding: EdgeInsets.all(10),
        minWidth: 200,
        child: Center(
          child: Text(
            'Перемешать',
            style: TextStyle(
              fontSize: 30.0,
              fontFamily: 'YanoneKaffeesatz',
            ),
          ),
        ),
      ),
      borderRadius: BorderRadius.all(Radius.circular(20)),
    );
  }
}
