import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Widgets/NumericBar.dart';
import 'package:japp_app/Widgets/AnswerOptions.dart';

class ABCTestScreen extends StatelessWidget {
  static const String id = 'abctest_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 50, bottom: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.grey[100],
              height: 50,
              child: GridView.count(
                scrollDirection: Axis.horizontal,
                crossAxisCount: 1,
                children: List.generate(Provider.of<Quiz>(context).listLength,
                    (index) {
                  return NumericBar(
                    num: index + 1,
                  );
                }),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 5),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 57),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        color: Colors.grey[300]),
                    width: double.infinity,
                    height: 100,
                    child: Center(
                      child: Text(
                        Provider.of<Quiz>(context)
                            .questList[
                                Provider.of<Quiz>(context).selectedNum - 1]
                            .symbol,
                        style: TextStyle(
                            fontFamily: 'YanoneKaffeesatz',
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            letterSpacing: 2.5),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  AnswerOptions(
                    option: Provider.of<Quiz>(context)
                        .questList[Provider.of<Quiz>(context).selectedNum - 1]
                        .variants[0],
                  ),
                  AnswerOptions(
                    option: Provider.of<Quiz>(context)
                        .questList[Provider.of<Quiz>(context).selectedNum - 1]
                        .variants[1],
                  ),
                  AnswerOptions(
                    option: Provider.of<Quiz>(context)
                        .questList[Provider.of<Quiz>(context).selectedNum - 1]
                        .variants[2],
                  ),
                  AnswerOptions(
                    option: Provider.of<Quiz>(context)
                        .questList[Provider.of<Quiz>(context).selectedNum - 1]
                        .variants[3],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}