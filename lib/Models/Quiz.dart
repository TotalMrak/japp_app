import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/DBP.dart';
import 'Question.dart';
import 'DataProv.dart';
import 'Card.dart';

class Quiz extends ChangeNotifier {
  List<Question> questList = [];
  int listLength;
  int selectedNum = 1;
  int finishedQ = 0;
  QCard card;

  void quizCreate(MainData mainData) {
    questList.clear();
    card = QCard(mainData.selectedKatakana, mainData.selectedHiragana);
    finishedQ = 0;
    selectedNum = 1;
    questList = card.questList;
    questList.shuffle();
    listLength = questList.length;
    DBProvider.db.insertCard(card);
    notifyListeners();
  }

  void quizDeleteCard() {
    DBProvider.db.deleteCard(card.dateTime);
  }

  void quizFromCardCreate(QCard qcard) {
    questList.clear();
    card = qcard;
    finishedQ = card.questList.where((e) => e.hasAnswerGiven).length;
    selectedNum = 1;
    questList = card.questList;
    listLength = questList.length;
    notifyListeners();
  }

  void quizFullClear() {
    questList = [];
    listLength = 0;
    selectedNum = 1;
    finishedQ = 0;
  }

  void chooseNum(int x) {
    selectedNum = x;
    notifyListeners();
  }

  void nextNum() {
    if (finishedQ != questList.length)
      selectedNum =
          questList.indexWhere((element) => !(element.hasAnswerGiven)) + 1;
    notifyListeners();
  }

  Color setColorNum(int x) {
    if (questList[x - 1].hasAnswerGiven) {
      if (x == selectedNum) {
        return questList[selectedNum - 1].myAnswer ==
                questList[selectedNum - 1].answer
            ? Colors.green[400]
            : Colors.red[400];
      }
      return questList[x - 1].myAnswer == questList[x - 1].answer
          ? Colors.green[100]
          : Colors.red[100];
    } else if (x == selectedNum) {
      return Colors.purple[300];
    }
    return Colors.grey[300];
  }

  void checkAnswer(String ans) {
    if (!questList[selectedNum - 1].hasAnswerGiven) {
      questList[selectedNum - 1].readAnswer(ans);
      finishedQ++;
    }
    card.progressUp();
    DBProvider.db.updateCards(card);
    notifyListeners();
  }

  Container setIcon(String ans) {
    if (questList[selectedNum - 1].hasAnswerGiven) {
      if (questList[selectedNum - 1].answerIsRight(ans)) {
        return Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: Colors.black26)),
          child: Icon(
            Icons.check,
            color: Colors.green,
          ),
        );
      } else if (questList[selectedNum - 1].myAnswer == ans)
        return Container(
          margin: EdgeInsets.all(2),
          padding: EdgeInsets.all(1),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              border: Border.all(width: 2, color: Colors.black26)),
          child: Icon(
            Icons.remove,
            color: Colors.red,
          ),
        );
    }
    return Container(
      margin: EdgeInsets.all(2),
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(width: 2, color: Colors.black26)),
      child: Icon(
        Icons.circle,
        color: Colors.grey[100],
      ),
    );
  }
}
