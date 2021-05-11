import 'Question.dart';
import 'package:japp_app/constants.dart';
import 'dart:convert';

class QCard {
  DateTime _dateTime;
  int _progress;
  List<Question> _questList = [];
  bool check = false;

  List<Question> get questList {
    return _questList;
  }

  DateTime get dateTime {
    return _dateTime;
  }

  int get progress {
    return _progress;
  }

  void toggleDone() {
    check = !check;
  }

  void progressUp() {
    _progress++;
  }

  QCard(List<String> kata, List<String> hira) {
    _dateTime = DateTime.now();
    _progress = 0;
    for (var s in hira) {
      switch (s) {
        case 'a i u e o':
          {
            _questList.add(Question(keysHira['a'], 'a'));
            _questList.add(Question(keysHira['i'], 'i'));
            _questList.add(Question(keysHira['u'], 'u'));
            _questList.add(Question(keysHira['e'], 'e'));
            _questList.add(Question(keysHira['o'], 'o'));
            break;
          }
        case 'K':
          {
            _questList.add(Question(keysHira['ka'], 'ka'));
            _questList.add(Question(keysHira['ki'], 'ki'));
            _questList.add(Question(keysHira['ku'], 'ku'));
            _questList.add(Question(keysHira['ke'], 'ke'));
            _questList.add(Question(keysHira['ko'], 'ko'));
            break;
          }
        case 'G':
          {
            _questList.add(Question(keysHira['ga'], 'ga'));
            _questList.add(Question(keysHira['gi'], 'gi'));
            _questList.add(Question(keysHira['gu'], 'gu'));
            _questList.add(Question(keysHira['ge'], 'ge'));
            _questList.add(Question(keysHira['go'], 'go'));
            break;
          }
        case 'S':
          {
            _questList.add(Question(keysHira['sa'], 'sa'));
            _questList.add(Question(keysHira['shi'], 'shi'));
            _questList.add(Question(keysHira['su'], 'su'));
            _questList.add(Question(keysHira['se'], 'se'));
            _questList.add(Question(keysHira['so'], 'so'));
            break;
          }
        case 'Z':
          {
            _questList.add(Question(keysHira['za'], 'za'));
            _questList.add(Question(keysHira['ji'], 'ji'));
            _questList.add(Question(keysHira['zu'], 'zu'));
            _questList.add(Question(keysHira['ze'], 'ze'));
            _questList.add(Question(keysHira['zo'], 'zo'));
            break;
          }
        case 'T':
          {
            _questList.add(Question(keysHira['ta'], 'ta'));
            _questList.add(Question(keysHira['chi'], 'chi'));
            _questList.add(Question(keysHira['tsu'], 'tsu'));
            _questList.add(Question(keysHira['te'], 'te'));
            _questList.add(Question(keysHira['to'], 'to'));
            break;
          }
        case 'D':
          {
            _questList.add(Question(keysHira['da'], 'da'));
            _questList.add(Question(keysHira['ji'], 'ji'));
            _questList.add(Question(keysHira['zu(d)'], 'zu(d)'));
            _questList.add(Question(keysHira['de'], 'de'));
            _questList.add(Question(keysHira['do'], 'do'));
            break;
          }
        case 'N':
          {
            _questList.add(Question(keysHira['na'], 'na'));
            _questList.add(Question(keysHira['ni'], 'ni'));
            _questList.add(Question(keysHira['nu'], 'nu'));
            _questList.add(Question(keysHira['ne'], 'ne'));
            _questList.add(Question(keysHira['no'], 'no'));
            break;
          }
        case 'H':
          {
            _questList.add(Question(keysHira['ha'], 'ha'));
            _questList.add(Question(keysHira['hi'], 'hi'));
            _questList.add(Question(keysHira['fu'], 'fu'));
            _questList.add(Question(keysHira['he'], 'he'));
            _questList.add(Question(keysHira['ho'], 'ho'));
            break;
          }
        case 'B':
          {
            _questList.add(Question(keysHira['ba'], 'ba'));
            _questList.add(Question(keysHira['bi'], 'bi'));
            _questList.add(Question(keysHira['bu'], 'bu'));
            _questList.add(Question(keysHira['be'], 'be'));
            _questList.add(Question(keysHira['bo'], 'bo'));
            break;
          }
        case 'P':
          {
            _questList.add(Question(keysHira['pa'], 'pa'));
            _questList.add(Question(keysHira['pi'], 'pi'));
            _questList.add(Question(keysHira['pu'], 'pu'));
            _questList.add(Question(keysHira['pe'], 'pe'));
            _questList.add(Question(keysHira['po'], 'po'));
            break;
          }
        case 'M':
          {
            _questList.add(Question(keysHira['ma'], 'ma'));
            _questList.add(Question(keysHira['mi'], 'mi'));
            _questList.add(Question(keysHira['mu'], 'mu'));
            _questList.add(Question(keysHira['me'], 'me'));
            _questList.add(Question(keysHira['mo'], 'mo'));
            break;
          }
        case 'Y':
          {
            _questList.add(Question(keysHira['ya'], 'ya'));
            _questList.add(Question(keysHira['yu'], 'yu'));
            _questList.add(Question(keysHira['yo'], 'yo'));
            break;
          }
        case 'R':
          {
            _questList.add(Question(keysHira['ra'], 'ra'));
            _questList.add(Question(keysHira['ri'], 'ri'));
            _questList.add(Question(keysHira['ru'], 'ru'));
            _questList.add(Question(keysHira['re'], 're'));
            _questList.add(Question(keysHira['ro'], 'ro'));
            break;
          }
        case 'W N':
          {
            _questList.add(Question(keysHira['wa'], 'wa'));
            _questList.add(Question(keysHira['n'], 'n'));
            _questList.add(Question(keysHira['wo'], 'wo'));
            break;
          }
      }
    }
    for (var s in kata) {
      switch (s) {
        case 'a i u e o':
          {
            _questList.add(Question(keysKata['a'], 'a'));
            _questList.add(Question(keysKata['i'], 'i'));
            _questList.add(Question(keysKata['u'], 'u'));
            _questList.add(Question(keysKata['e'], 'e'));
            _questList.add(Question(keysKata['o'], 'o'));
            break;
          }
        case 'K':
          {
            _questList.add(Question(keysKata['ka'], 'ka'));
            _questList.add(Question(keysKata['ki'], 'ki'));
            _questList.add(Question(keysKata['ku'], 'ku'));
            _questList.add(Question(keysKata['ke'], 'ke'));
            _questList.add(Question(keysKata['ko'], 'ko'));
            break;
          }
        case 'G':
          {
            _questList.add(Question(keysKata['ga'], 'ga'));
            _questList.add(Question(keysKata['gi'], 'gi'));
            _questList.add(Question(keysKata['gu'], 'gu'));
            _questList.add(Question(keysKata['ge'], 'ge'));
            _questList.add(Question(keysKata['go'], 'go'));
            break;
          }
        case 'S':
          {
            _questList.add(Question(keysKata['sa'], 'sa'));
            _questList.add(Question(keysKata['shi'], 'shi'));
            _questList.add(Question(keysKata['su'], 'su'));
            _questList.add(Question(keysKata['se'], 'se'));
            _questList.add(Question(keysKata['so'], 'so'));
            break;
          }
        case 'Z':
          {
            _questList.add(Question(keysKata['za'], 'za'));
            _questList.add(Question(keysKata['ji'], 'ji'));
            _questList.add(Question(keysKata['zu(z)'], 'zu(z)'));
            _questList.add(Question(keysKata['ze'], 'ze'));
            _questList.add(Question(keysKata['zo'], 'zo'));
            break;
          }
        case 'T':
          {
            _questList.add(Question(keysKata['ta'], 'ta'));
            _questList.add(Question(keysKata['chi'], 'chi'));
            _questList.add(Question(keysKata['tsu'], 'tsu'));
            _questList.add(Question(keysKata['te'], 'te'));
            _questList.add(Question(keysKata['to'], 'to'));
            break;
          }
        case 'D':
          {
            _questList.add(Question(keysKata['da'], 'da'));
            _questList.add(Question(keysKata['di'], 'di'));
            _questList.add(Question(keysKata['du'], 'du'));
            _questList.add(Question(keysKata['de'], 'de'));
            _questList.add(Question(keysKata['do'], 'do'));
            break;
          }
        case 'N':
          {
            _questList.add(Question(keysKata['na'], 'na'));
            _questList.add(Question(keysKata['ni'], 'ni'));
            _questList.add(Question(keysKata['nu'], 'nu'));
            _questList.add(Question(keysKata['ne'], 'ne'));
            _questList.add(Question(keysKata['no'], 'no'));
            break;
          }
        case 'H':
          {
            _questList.add(Question(keysKata['ha'], 'ha'));
            _questList.add(Question(keysKata['hi'], 'hi'));
            _questList.add(Question(keysKata['fu'], 'fu'));
            _questList.add(Question(keysKata['he'], 'he'));
            _questList.add(Question(keysKata['ho'], 'ho'));
            break;
          }
        case 'B':
          {
            _questList.add(Question(keysKata['ba'], 'ba'));
            _questList.add(Question(keysKata['bi'], 'bi'));
            _questList.add(Question(keysKata['bu'], 'bu'));
            _questList.add(Question(keysKata['be'], 'be'));
            _questList.add(Question(keysKata['bo'], 'bo'));
            break;
          }
        case 'P':
          {
            _questList.add(Question(keysKata['pa'], 'pa'));
            _questList.add(Question(keysKata['pi'], 'pi'));
            _questList.add(Question(keysKata['pu'], 'pu'));
            _questList.add(Question(keysKata['pe'], 'pe'));
            _questList.add(Question(keysKata['po'], 'po'));
            break;
          }
        case 'M':
          {
            _questList.add(Question(keysKata['ma'], 'ma'));
            _questList.add(Question(keysKata['mi'], 'mi'));
            _questList.add(Question(keysKata['mu'], 'mu'));
            _questList.add(Question(keysKata['me'], 'me'));
            _questList.add(Question(keysKata['mo'], 'mo'));
            break;
          }
        case 'Y':
          {
            _questList.add(Question(keysKata['ya'], 'ya'));
            _questList.add(Question(keysKata['yu'], 'yu'));
            _questList.add(Question(keysKata['yo'], 'yo'));
            break;
          }
        case 'R':
          {
            _questList.add(Question(keysKata['ra'], 'ra'));
            _questList.add(Question(keysKata['ri'], 'ri'));
            _questList.add(Question(keysKata['ru'], 'ru'));
            _questList.add(Question(keysKata['re'], 're'));
            _questList.add(Question(keysKata['ro'], 'ro'));
            break;
          }
        case 'W N':
          {
            _questList.add(Question(keysKata['wa'], 'wa'));
            _questList.add(Question(keysKata['n'], 'n'));
            _questList.add(Question(keysKata['wo'], 'wo'));
            break;
          }
      }
    }
    _questList.shuffle();
  }

  QCard.words(List<Question> questReady) {
    _dateTime = DateTime.now();
    _progress = 0;
    _questList = questReady;
  }

  QCard._ready(DateTime dateTime, int progress, List<Question> questList) {
    this._dateTime = dateTime;
    this._progress = progress;
    this._questList = questList;
  }

  String cardToJSON(QCard data) {
    final dyn = data.toJson();
    return json.encode(dyn);
  }

  Map<String, dynamic> toJson() => {
        "datetime": _dateTime.toIso8601String(),
        "progress": _progress,
        "questions":
            List<dynamic>.from(_questList.map((e) => e.toJson())).join('_'),
      };

  factory QCard.fromJson(Map<String, dynamic> json) {
    var res = QCard._ready(
      DateTime.parse(json["datetime"]),
      json["progress"],
      List<Question>.from(
          splitToQuestionList(json["questions"].toString().split('_'))),
    );
    return res;
  }

  QCard cardFromJson(String str) {
    final jsonData = json.decode(str);
    return QCard.fromJson(jsonData);
  }
}

bool checkJsonQuestion(Question q1, Question q2) {
  // check if both are lists
  if (!(q1.variants is List && q2.variants is List)
      // check if both have same length
      ||
      q1.variants.length != q2.variants.length) {
    return false;
  }

  // check if elements are equal
  for (int i = 0; i < q1.variants.length; i++) {
    if (q1.variants[i] != q2.variants[i]) {
      return false;
    }
  }
  return true;
}

List<Question> splitToQuestionList(List<String> s) {
  List<Question> res = [];
  for (var e in s) {
    String s1 = e.substring(9, e.indexOf(','));
    String s2 = e.substring(e.indexOf('answer: ') + 8, e.indexOf(", var"));
    List<String> s3 =
        e.substring(e.indexOf('ants: [') + 7, e.indexOf('], has')).split(', ');
    bool s4 =
        e.substring(e.indexOf('Given: ') + 7, e.indexOf(', myAnswer')).length ==
            4;
    var s5t = e.substring(e.indexOf('myAnswer: ') + 10, e.indexOf('}'));
    var s5 = s5t == 'null' ? null : s5t;
    res.add(Question.ready(s1, s2, s3, s4, s5));
  }
  return res;
}
