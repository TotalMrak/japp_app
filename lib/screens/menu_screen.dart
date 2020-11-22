import 'package:flutter/material.dart';
import 'package:japp_app/screens/abc_screen.dart';
import 'package:japp_app/Widgets/MainButton.dart';
import 'package:japp_app/Widgets//CircleIcon.dart';
import 'package:japp_app/constants.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          "Первый шаг к Японии",
          style: TextStyle(
              color: Colors.white54,
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
                  CircleIcon(
                    icon: Icons.help,
                    colour: Colors.black26,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  CircleIcon(
                    icon: Icons.info_outline,
                    colour: Colors.black26,
                  )
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
              Expanded(
                flex: 3,
                child: MainButton(
                  ontap: () {
                    for (var items in keysHira.entries) {
                      print("'${items.value}' : '${items.key}',\n");
                    }
                  },
                  text: 'Слова',
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
