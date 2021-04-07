import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/Card.dart';
import 'package:japp_app/screens/abc_test.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class ArchiveCard extends StatelessWidget {
  ArchiveCard({@required this.card, @required this.checkBoxCallback});

  final QCard card;
  final Function checkBoxCallback;

  String setDate() {
    return "${card.dateTime.day}.${card.dateTime.month}.${card.dateTime.year}";
  }

  String setTime() {
    if (card.dateTime.minute < 10)
      return "${card.dateTime.hour}:0${card.dateTime.minute}";
    return "${card.dateTime.hour}:${card.dateTime.minute}";
  }

  Color setColor() {
    var trueAns = card.questList.where((e) => e.myAnswer == e.answer).length;
    var falseAns = card.questList
        .where((e) => e.hasAnswerGiven && e.myAnswer != e.answer)
        .length;
    var ratio = trueAns / falseAns * 100;
    if (ratio < 20) return Colors.red;
    if (ratio < 40) return Colors.orange;
    if (ratio < 60) return Colors.yellow;
    return Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    return SlideInDown(
      duration: const Duration(milliseconds: 300),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            primary: Colors.indigo[200],
            side: BorderSide(color: Colors.lightGreen[100], width: 0.7),
            //      padding: EdgeInsets.symmetric(horizontal: 1, vertical: 2),
            minimumSize: Size(179, 83),
            padding: EdgeInsets.only(top: 1, bottom: 10, left: 10, right: 5)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CircularPercentIndicator(
              progressColor: setColor(),
              radius: 80,
              lineWidth: 8,
              percent: (card.progress / (card.questList.length)),
              center: Text(
                (card.progress / (card.questList.length) * 100)
                        .toStringAsFixed(1) +
                    '%',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Верных ответов: ' +
                      card.questList
                          .where((e) => e.myAnswer == e.answer)
                          .length
                          .toString(),
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Всего вопросов: ' + card.questList.length.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Checkbox(
                    value: card.check,
                    onChanged: checkBoxCallback,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    setTime(),
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Text(
                    setDate(),
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        onPressed: () {
          Provider.of<Quiz>(context, listen: false).quizFromCardCreate(card);
          Navigator.popAndPushNamed(context, ABCTestScreen.id);
        },
      ),
    );
  }
}
