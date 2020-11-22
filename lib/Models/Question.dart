import 'dart:collection';

import 'package:japp_app/constants.dart';
import 'dart:math';

class Question {
  String _symbol;
  String _answer;
  List<String> variants = [];
  bool hasAnswerGiven = false;
  String myAnswer;

  String get symbol {
    return _symbol;
  }

  String get answer {
    return _answer;
  }

  Question(String s, String a) {
    _symbol = s;
    _answer = a;
    variants.add(a);
    for (int i = 0; i < 3; i++) {
      var x = keysKata.keys.elementAt(Random().nextInt(keysKata.length));
      if (!variants.contains(x))
        variants.add(x);
      else
        i--;
    }
    variants.shuffle();
  }

  void readAnswer(String ans) {
    hasAnswerGiven = true;
    myAnswer = ans;
  }

  bool answerIsRight(String ans) => ans == _answer;
}
