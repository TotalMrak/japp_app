import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/DataProv.dart';

class Bar extends StatelessWidget {
  Bar({
    this.line,
  });

  final String line;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<MainData>(context, listen: false).updateChar(line);
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.black38),
            gradient: LinearGradient(
                colors: Provider.of<MainData>(context).barColour(line))),
        child: Center(
          child: Text(
            line,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
