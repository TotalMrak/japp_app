import 'dart:collection';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/constants.dart';

class MainData extends ChangeNotifier {
  List<String> _selectedKatakana = [];
  List<String> _selectedHiragana = [];
  bool hiraganaOn = false;
  bool katakanaOn = false;

  UnmodifiableListView<String> get selectedKatakana {
    return UnmodifiableListView(_selectedKatakana);
  }

  UnmodifiableListView<String> get selectedHiragana {
    return UnmodifiableListView(_selectedHiragana);
  }

  void updateChar(String s) {
    if (hiraganaOn & katakanaOn) {
      if (selectedKatakana.contains(s) && selectedHiragana.contains(s)) {
        _selectedHiragana.remove(s);
        _selectedKatakana.remove(s);
        notifyListeners();
        return;
      } else if (!selectedKatakana.contains(s)) {
        _selectedKatakana.add(s);
      }
      if (!selectedHiragana.contains(s)) _selectedHiragana.add(s);
    } else {
      if (hiraganaOn) {
        updateHiraChar(s);
      } else if (katakanaOn) {
        updateKataChar(s);
      }
      if (!(hiraganaOn | katakanaOn)) {
        if (_selectedKatakana.contains(s)) _selectedKatakana.remove(s);
        if (_selectedHiragana.contains(s)) _selectedHiragana.remove(s);
      }
    }
    notifyListeners();
  }

  void updateKataChar(String s) {
    if (!selectedKatakana.contains(s))
      _selectedKatakana.add(s);
    else
      _selectedKatakana.remove(s);
  }

  void updateHiraChar(String s) {
    if (!selectedHiragana.contains(s))
      _selectedHiragana.add(s);
    else
      _selectedHiragana.remove(s);
  }

  void changePressedKata() {
    katakanaOn = !katakanaOn;
    notifyListeners();
  }

  void changePressedHira() {
    hiraganaOn = !hiraganaOn;
    notifyListeners();
  }

  bool checkLists() {
    return selectedKatakana.isNotEmpty || selectedHiragana.isNotEmpty;
  }

  List<Color> barColour(String s) {
    List<Color> res = [];
    if (selectedHiragana.contains(s)) {
      if (selectedKatakana.contains(s)) {
        res.add(Colors.blueAccent);
        res.add(Colors.greenAccent);
        return res;
      } else {
        res.add(Colors.greenAccent);
        res.add(Colors.greenAccent);
        return res;
      }
    } else if (selectedKatakana.contains(s)) {
      res.add(Colors.blueAccent);
      res.add(Colors.blueAccent);
      return res;
    }
    res.add(Colors.blueGrey[100]);
    res.add(Colors.blueGrey[100]);
    return res;
  }

  void randomChars() {
    clearAll();
    for (var i = 0; i < SoundsEng.length; i++) {
      if (Random().nextBool()) _selectedKatakana.add(SoundsEng[i]);
      if (Random().nextBool()) _selectedHiragana.add(SoundsEng[i]);
    }
    notifyListeners();
  }

  void clearAll() {
    _selectedKatakana.clear();
    _selectedHiragana.clear();
    notifyListeners();
  }

  void showPic(String s) {}
}
