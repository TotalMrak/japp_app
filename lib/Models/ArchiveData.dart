import 'package:flutter/material.dart';
import 'package:japp_app/Models/DBP.dart';
import 'Card.dart';

class ArchiveData extends ChangeNotifier {
  List<QCard> abc = [];
  bool showDel = false;

  void getArchive() {
    var save = DBProvider.db.getCards();
    save.then((value) {
      abc = value;
      notifyListeners();
    });
    notifyListeners();
  }

  void updateCard(QCard card) {
    card.toggleDone();
    if (abc.where((e) => e.check).isNotEmpty) {
      showDel = true;
    } else
      showDel = false;
    notifyListeners();
  }

  void deleteChecked() {
    var res = abc.where((e) => e.check).toList();
    for (var e in res) {
      abc.remove(e);
      DBProvider.db.deleteCard(e.dateTime);
    }
    showDel = false;
    notifyListeners();
  }
}
