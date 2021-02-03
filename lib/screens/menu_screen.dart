import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/screens/ArchiveScreen.dart';
import 'package:japp_app/screens/abc_screen.dart';
import 'package:japp_app/Widgets/MainButton.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Первый шаг к Японии",
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'YanoneKaffeesatz',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MainButton(
              ontap: () {
                Navigator.pushNamed(context, ABCScreen.id);
              },
              text: 'Азбука',
            ),
            Builder(
              builder: (context) => MainButton(
                text: 'Слова',
                ontap: () {
                  final snackBar = SnackBar(
                    content: Text('В процессе разработки...'),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        // Some code to undo the change.
                      },
                    ),
                  );
                  Scaffold.of(context).showSnackBar(snackBar);
                },
              ),
            ),
            MainButton(
              text: 'Архив',
              colour: Colors.green,
              ontap: () {
                Navigator.pushNamed(context, ArchiveScreen.id);
              },
            ),
          ],
        ),
      ),
    );
  }
}
