import 'package:japp_app/constants.dart';
import 'dart:math';
import 'dart:convert';

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

  Question.ready(String symbol, String answer, List<String> variants,
      bool hasAnswerGiven, String myAnswer) {
    this._symbol = symbol;
    this._answer = answer;
    this.variants = variants;
    this.hasAnswerGiven = hasAnswerGiven;
    this.myAnswer = myAnswer;
  }

  void readAnswer(String ans) {
    hasAnswerGiven = true;
    myAnswer = ans;
  }

  bool answerIsRight(String ans) => ans == _answer;

  String cardToJSON(Question data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }

  Map<String, dynamic> toJson() => {
        "symbol": _symbol,
        "answer": _answer,
        "variants": List<dynamic>.from(variants.map((x) => x)),
        "hasAnswerGiven": hasAnswerGiven,
        "myAnswer": myAnswer,
      };

  factory Question.fromJson(Map<String, dynamic> json) => Question.ready(
        json["symbol"],
        json["answer"],
        List<String>.from(json["variants"].map((x) => x)),
        json["hasAnswerGiven"],
        json["myAnswer"],
      );

  Question clientFromJson(String str) {
    final jsonData = json.decode(str);
    return Question.fromJson(jsonData);
  }
}
