import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Question.dart';
import 'DataProv.dart';
import 'package:japp_app/constants.dart';

class Quiz extends ChangeNotifier {
  List<Question> questList = [];
  int listLength;
  List<String> rdyKata = [];
  List<String> rdyHira = [];
  int selectedNum = 1;
  int finishedQ = 0;

  Quiz(MainData mainData) {
    rdyHira = mainData.selectedHiragana;
    rdyKata = mainData.selectedKatakana;
  }

  void quizCreate() {
    questList.clear();
    finishedQ = 0;
    selectedNum = 1;
    for (var s in rdyHira) {
      switch (s) {
        case 'a i u e o':
          {
            questList.add(Question(keysHira['a'], 'a'));
            questList.add(Question(keysHira['i'], 'i'));
            questList.add(Question(keysHira['u'], 'u'));
            questList.add(Question(keysHira['e'], 'e'));
            questList.add(Question(keysHira['o'], 'o'));
            break;
          }
        case 'K':
          {
            questList.add(Question(keysHira['ka'], 'ka'));
            questList.add(Question(keysHira['ki'], 'ki'));
            questList.add(Question(keysHira['ku'], 'ku'));
            questList.add(Question(keysHira['ke'], 'ke'));
            questList.add(Question(keysHira['ko'], 'ko'));
            break;
          }
        case 'G':
          {
            questList.add(Question(keysHira['ga'], 'ga'));
            questList.add(Question(keysHira['gi'], 'gi'));
            questList.add(Question(keysHira['gu'], 'gu'));
            questList.add(Question(keysHira['ge'], 'ge'));
            questList.add(Question(keysHira['go'], 'go'));
            break;
          }
        case 'S':
          {
            questList.add(Question(keysHira['sa'], 'sa'));
            questList.add(Question(keysHira['shi'], 'shi'));
            questList.add(Question(keysHira['su'], 'su'));
            questList.add(Question(keysHira['se'], 'se'));
            questList.add(Question(keysHira['so'], 'so'));
            break;
          }
        case 'Z':
          {
            questList.add(Question(keysHira['za'], 'za'));
            questList.add(Question(keysHira['ji'], 'ji'));
            questList.add(Question(keysHira['zu'], 'zu'));
            questList.add(Question(keysHira['ze'], 'ze'));
            questList.add(Question(keysHira['zo'], 'zo'));
            break;
          }
        case 'T':
          {
            questList.add(Question(keysHira['ta'], 'ta'));
            questList.add(Question(keysHira['chi'], 'chi'));
            questList.add(Question(keysHira['tsu'], 'tsu'));
            questList.add(Question(keysHira['te'], 'te'));
            questList.add(Question(keysHira['to'], 'to'));
            break;
          }
        case 'D':
          {
            questList.add(Question(keysHira['da'], 'da'));
            questList.add(Question(keysHira['ji'], 'ji'));
            questList.add(Question(keysHira['zu(d)'], 'zu(d)'));
            questList.add(Question(keysHira['de'], 'de'));
            questList.add(Question(keysHira['do'], 'do'));
            break;
          }
        case 'N':
          {
            questList.add(Question(keysHira['na'], 'na'));
            questList.add(Question(keysHira['ni'], 'ni'));
            questList.add(Question(keysHira['nu'], 'nu'));
            questList.add(Question(keysHira['ne'], 'ne'));
            questList.add(Question(keysHira['no'], 'no'));
            break;
          }
        case 'H':
          {
            questList.add(Question(keysHira['ha'], 'ha'));
            questList.add(Question(keysHira['hi'], 'hi'));
            questList.add(Question(keysHira['fu'], 'fu'));
            questList.add(Question(keysHira['he'], 'he'));
            questList.add(Question(keysHira['ho'], 'ho'));
            break;
          }
        case 'B':
          {
            questList.add(Question(keysHira['ba'], 'ba'));
            questList.add(Question(keysHira['bi'], 'bi'));
            questList.add(Question(keysHira['bu'], 'bu'));
            questList.add(Question(keysHira['be'], 'be'));
            questList.add(Question(keysHira['bo'], 'bo'));
            break;
          }
        case 'P':
          {
            questList.add(Question(keysHira['pa'], 'pa'));
            questList.add(Question(keysHira['pi'], 'pi'));
            questList.add(Question(keysHira['pu'], 'pu'));
            questList.add(Question(keysHira['pe'], 'pe'));
            questList.add(Question(keysHira['po'], 'po'));
            break;
          }
        case 'M':
          {
            questList.add(Question(keysHira['ma'], 'ma'));
            questList.add(Question(keysHira['mi'], 'mi'));
            questList.add(Question(keysHira['mu'], 'mu'));
            questList.add(Question(keysHira['me'], 'me'));
            questList.add(Question(keysHira['mo'], 'mo'));
            break;
          }
        case 'Y':
          {
            questList.add(Question(keysHira['ya'], 'ya'));
            questList.add(Question(keysHira['yu'], 'yu'));
            questList.add(Question(keysHira['yo'], 'yo'));
            break;
          }
        case 'R':
          {
            questList.add(Question(keysHira['ra'], 'ra'));
            questList.add(Question(keysHira['ri'], 'ri'));
            questList.add(Question(keysHira['ru'], 'ru'));
            questList.add(Question(keysHira['re'], 're'));
            questList.add(Question(keysHira['ro'], 'ro'));
            break;
          }
        case 'W N':
          {
            questList.add(Question(keysHira['wa'], 'wa'));
            questList.add(Question(keysHira['n'], 'n'));
            questList.add(Question(keysHira['wo'], 'wo'));
            break;
          }
      }
    }
    for (var s in rdyKata) {
      switch (s) {
        case 'a i u e o':
          {
            questList.add(Question(keysKata['a'], 'a'));
            questList.add(Question(keysKata['i'], 'i'));
            questList.add(Question(keysKata['u'], 'u'));
            questList.add(Question(keysKata['e'], 'e'));
            questList.add(Question(keysKata['o'], 'o'));
            break;
          }
        case 'K':
          {
            questList.add(Question(keysKata['ka'], 'ka'));
            questList.add(Question(keysKata['ki'], 'ki'));
            questList.add(Question(keysKata['ku'], 'ku'));
            questList.add(Question(keysKata['ke'], 'ke'));
            questList.add(Question(keysKata['ko'], 'ko'));
            break;
          }
        case 'G':
          {
            questList.add(Question(keysKata['ga'], 'ga'));
            questList.add(Question(keysKata['gi'], 'gi'));
            questList.add(Question(keysKata['gu'], 'gu'));
            questList.add(Question(keysKata['ge'], 'ge'));
            questList.add(Question(keysKata['go'], 'go'));
            break;
          }
        case 'S':
          {
            questList.add(Question(keysKata['sa'], 'sa'));
            questList.add(Question(keysKata['shi'], 'shi'));
            questList.add(Question(keysKata['su'], 'su'));
            questList.add(Question(keysKata['se'], 'se'));
            questList.add(Question(keysKata['so'], 'so'));
            break;
          }
        case 'Z':
          {
            questList.add(Question(keysKata['za'], 'za'));
            questList.add(Question(keysKata['ji'], 'ji'));
            questList.add(Question(keysKata['zu(z)'], 'zu(z)'));
            questList.add(Question(keysKata['ze'], 'ze'));
            questList.add(Question(keysKata['zo'], 'zo'));
            break;
          }
        case 'T':
          {
            questList.add(Question(keysKata['ta'], 'ta'));
            questList.add(Question(keysKata['chi'], 'chi'));
            questList.add(Question(keysKata['tsu'], 'tsu'));
            questList.add(Question(keysKata['te'], 'te'));
            questList.add(Question(keysKata['to'], 'to'));
            break;
          }
        case 'D':
          {
            questList.add(Question(keysKata['da'], 'da'));
            questList.add(Question(keysKata['di'], 'di'));
            questList.add(Question(keysKata['du'], 'du'));
            questList.add(Question(keysKata['de'], 'de'));
            questList.add(Question(keysKata['do'], 'do'));
            break;
          }
        case 'N':
          {
            questList.add(Question(keysKata['na'], 'na'));
            questList.add(Question(keysKata['ni'], 'ni'));
            questList.add(Question(keysKata['nu'], 'nu'));
            questList.add(Question(keysKata['ne'], 'ne'));
            questList.add(Question(keysKata['no'], 'no'));
            break;
          }
        case 'H':
          {
            questList.add(Question(keysKata['ha'], 'ha'));
            questList.add(Question(keysKata['hi'], 'hi'));
            questList.add(Question(keysKata['fu'], 'fu'));
            questList.add(Question(keysKata['he'], 'he'));
            questList.add(Question(keysKata['ho'], 'ho'));
            break;
          }
        case 'B':
          {
            questList.add(Question(keysKata['ba'], 'ba'));
            questList.add(Question(keysKata['bi'], 'bi'));
            questList.add(Question(keysKata['bu'], 'bu'));
            questList.add(Question(keysKata['be'], 'be'));
            questList.add(Question(keysKata['bo'], 'bo'));
            break;
          }
        case 'P':
          {
            questList.add(Question(keysKata['pa'], 'pa'));
            questList.add(Question(keysKata['pi'], 'pi'));
            questList.add(Question(keysKata['pu'], 'pu'));
            questList.add(Question(keysKata['pe'], 'pe'));
            questList.add(Question(keysKata['po'], 'po'));
            break;
          }
        case 'M':
          {
            questList.add(Question(keysKata['ma'], 'ma'));
            questList.add(Question(keysKata['mi'], 'mi'));
            questList.add(Question(keysKata['mu'], 'mu'));
            questList.add(Question(keysKata['me'], 'me'));
            questList.add(Question(keysKata['mo'], 'mo'));
            break;
          }
        case 'Y':
          {
            questList.add(Question(keysKata['ya'], 'ya'));
            questList.add(Question(keysKata['yu'], 'yu'));
            questList.add(Question(keysKata['yo'], 'yo'));
            break;
          }
        case 'R':
          {
            questList.add(Question(keysKata['ra'], 'ra'));
            questList.add(Question(keysKata['ri'], 'ri'));
            questList.add(Question(keysKata['ru'], 'ru'));
            questList.add(Question(keysKata['re'], 're'));
            questList.add(Question(keysKata['ro'], 'ro'));
            break;
          }
        case 'W N':
          {
            questList.add(Question(keysKata['wa'], 'wa'));
            questList.add(Question(keysKata['n'], 'n'));
            questList.add(Question(keysKata['wo'], 'wo'));
            break;
          }
      }
    }
    questList.shuffle();
    listLength = questList.length;
    notifyListeners();
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
