import 'package:flutter/material.dart';
import 'package:japp_app/screens/creation_screen.dart';
import 'package:translator/translator.dart';
import 'package:http/http.dart' as http;

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

  Future<String> translateFromGoogle(String text) async {
    var sss = Uri.https('translation.googleapis.com', '/language/translate/v2',
        {'target': 'ja', 'key': CreationScreen.apiKey, 'q': text});
    final response = await http.post(sss);
    String res = response.body.substring(
        response.body.indexOf('translatedText'),
        response.body.indexOf('detectedSource'));
    res = res.substring(res.indexOf(':') + 3, res.lastIndexOf(',') - 1);
    return res;
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
