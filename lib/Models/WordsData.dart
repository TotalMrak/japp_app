import 'package:flutter/material.dart';
import 'package:japp_app/Models/Card.dart';
import 'package:japp_app/Models/Question.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class WordsData extends ChangeNotifier {
  List<FileSystemEntity> dirs = [];
  bool changeOptions = false;
  Directory currentLocation;
  List<FileSystemEntity> chosenDirs = [];
  Directory originLocation;

  void getFiles() {
    final directoryName = 'Words';
    var tempDir = getExternalStorageDirectory();
    tempDir.then((value) {
      final myDir = Directory('${value.path}/$directoryName');
      currentLocation = myDir;
      originLocation = myDir;
      dirs = currentLocation.listSync();
      notifyListeners();
    });
  }

  void createFolder(String name) {
    if (name.contains('.')) name = name.replaceAll('.', '-');
    final newDir = Directory('${currentLocation.path}/$name');
    var exists = newDir.exists();
    exists.then((value) {
      if (!value) {
        newDir.create();
      }
      dirs = currentLocation.listSync();
      notifyListeners();
    });
    notifyListeners();
  }

  void chooseFile(FileSystemEntity f) {
    if (chosenDirs.contains(f))
      chosenDirs.remove(f);
    else
      chosenDirs.add(f);
    notifyListeners();
  }

  void deleteChosen() {
    for (var e in chosenDirs) {
      dirs.remove(e);
      e.deleteSync();
    }
    chosenDirs.clear();
    notifyListeners();
  }

  void openFile(FileSystemEntity f) {
    currentLocation = f;
    dirs = currentLocation.listSync();
    chosenDirs.clear();
    notifyListeners();
  }

  QCard openTest(FileSystemEntity f) {
    List<Question> questList = [];
    Map<String, String> map = {};
    var lines = (f as File).readAsLinesSync();
    for (var e in lines) {
      var sss = e.split('%');
      map[sss[0]] = sss[1];
    }
    for (var e in map.keys) {
      questList.add(Question.words(map[e], e, map));
    }
    QCard card = QCard.words(questList);
    return card;
  }

  void getBack() {
    currentLocation = currentLocation.parent;
    dirs = currentLocation.listSync();
    chosenDirs.clear();
    notifyListeners();
  }

  void renameFile(FileSystemEntity f, String s) {
    if (s.contains('.')) s = s.replaceAll('.', '-');
    if (f is Directory) {
      var dir = f.parent.path;
      var newPath = dir + '/' + s;
      f.rename(newPath).then((value) {
        dirs = currentLocation.listSync();
        notifyListeners();
      });
    } else {
      var dir = f.parent.path;
      var newPath = dir + '/' + s;
      f.rename(newPath + '.txt').then((value) {
        dirs = currentLocation.listSync();
        notifyListeners();
      });
    }
    notifyListeners();
  }

  bool createFile(String name, Map<String, String> map) {
    var x = File("${currentLocation.path}/$name.txt");
    var exists = x.existsSync();
    if (exists) {
      return false;
    } else {
      x.create().then((value) {
        var sink = x.openWrite();
        for (var e in map.keys) {
          sink.writeln("$e%${map[e]}");
        }
        sink.close();
      });
      dirs = currentLocation.listSync();
      notifyListeners();
    }
    notifyListeners();
    return true;
  }

  void notify() {
    notifyListeners();
  }
}
