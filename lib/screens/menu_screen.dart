import 'package:flutter/material.dart';
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
        padding: EdgeInsets.all(8.0),
        child: Container(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  SizedBox(
                    width: 5,
                  ),
                ],
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  height: 20,
                ),
              ),
              Expanded(
                flex: 3,
                child: MainButton(
                  ontap: () {
                    Navigator.pushNamed(context, ABCScreen.id);
                  },
                  text: 'Азбука',
                ),
              ),
              Builder(
                builder: (context) => Expanded(
                  flex: 3,
                  child: MainButton(
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
              ),
              Expanded(
                flex: 4,
                child: SizedBox(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
