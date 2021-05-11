import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:provider/provider.dart';
import 'menu_screen.dart';

class ABCResultsScreen extends StatelessWidget {
  static const String id = 'AbcResults_screen';

  @override
  Widget build(BuildContext context) {
    int goodAns = Provider.of<Quiz>(context)
        .questList
        .where((element) => element.myAnswer == element.answer)
        .length;
    int allAns = Provider.of<Quiz>(context).finishedQ;

    Provider.of<Quiz>(context).quizDeleteCard();

    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop();
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            'Результаты теста',
            style: TextStyle(
              color: Colors.white70,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5,
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(top: 60, left: 5, right: 5, bottom: 5),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(15.0),
                margin: EdgeInsets.all(20),
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Правильных ответов: ',
                  style: TextStyle(
                      fontSize: 40,
                      color: Colors.lightGreen,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 2.5),
                  textAlign: TextAlign.center,
                ),
              )),
              Expanded(
                  child: Container(
                padding: EdgeInsets.all(20),
                margin: EdgeInsets.only(bottom: 15),
                decoration: BoxDecoration(
                  color: Colors.blue[100],
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$goodAns/$allAns',
                      style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5),
                    ),
                    Text(
                      '${(goodAns / allAns * 100).toStringAsFixed(1)}%',
                      style: TextStyle(
                          fontSize: 45,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 2.5),
                    ),
                  ],
                ),
              )),
              GestureDetector(
                onTap: () {
                  Navigator.popUntil(
                      context, ModalRoute.withName(MainScreen.id));
                },
                child: Container(
                  color: Colors.indigo,
                  width: double.infinity,
                  height: 80.0,
                  child: Center(
                    child: Text(
                      'Начать новый тест',
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2.5),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
