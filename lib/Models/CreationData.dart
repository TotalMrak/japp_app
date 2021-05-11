import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class CreationData extends ChangeNotifier {
  final translator = GoogleTranslator();
  bool fileCreated = false;
  Map<String, String> creation = {};
  String word;
  String translation;
  bool fieldEnabled = false;

  Future<String> translateToJap(String text) async {
    fieldEnabled = true;
    var res = await translator.translate(text, to: 'ja');
    return res.text;
  }

  void addWord(String s, String tr) {
    creation[s] = tr;
    notifyListeners();
  }

  void removeWord(String s) {
    creation.remove(s);
    notifyListeners();
  }

  void toggleField() {
    fieldEnabled = !fieldEnabled;
    notifyListeners();
  }

  void offField() {
    fieldEnabled = false;
    notifyListeners();
  }
}
