import 'Question.dart';
import 'package:japp_app/constants.dart';

class QCard {
  DateTime _dateTime;
  int _progress;
  List<Question> _questList = [];

  List<Question> get questList {
    return _questList;
  }

  DateTime get dateTime {
    return _dateTime;
  }

  int get progress {
    return _progress;
  }

  void progressUp() {
    if (_progress < 100) _progress++;
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
}