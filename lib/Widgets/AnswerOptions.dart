import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/Question.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:provider/provider.dart';

class AnswerOptions extends StatelessWidget {
  AnswerOptions({this.option});

  final String option;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
            minimumSize: Size(54, 54),
            backgroundColor: Colors.grey[100],
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            side: BorderSide(color: Colors.grey[600])),
        onPressed: () {
          Provider.of<Quiz>(context, listen: false).checkAnswer(option);
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 10,
            ),
            Provider.of<Quiz>(context).setIcon(option),
            SizedBox(
              width: 15,
            ),
            Text(
              option,
              style: TextStyle(
                  fontSize: 25,
                  fontFamily: 'YanoneKaffeesatz',
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
          ],
        ),
      ),
    );
  }
}
