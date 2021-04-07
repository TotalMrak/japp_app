import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
        if (!(Provider.of<MainData>(context, listen: false)).checkLists() &&
            !(Provider.of<MainData>(context, listen: false).katakanaOn ||
                Provider.of<MainData>(context, listen: false).hiraganaOn)) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: const Text(
              "Выберите азбуку",
              textAlign: TextAlign.center,
            ),
            duration: const Duration(milliseconds: 1100),
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ), // Width of the SnackBar.
            width: 250,
          ));
        }
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
