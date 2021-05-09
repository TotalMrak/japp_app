import 'package:flutter/material.dart';
import 'dart:io';
import 'package:path_provider/path_provider.dart';

class WordsData extends ChangeNotifier {
  List<FileSystemEntity> dirs = [];
  bool changeOptions = false;
  Directory currentLocation;
  List<FileSystemEntity> choosenDirs = [];
  Directory originLocation;

  void getFiles() {
    final directoryName = 'Words';
    var tempDir = getApplicationDocumentsDirectory();
    tempDir.then((value) {
      final myDir = Directory('${value.path}/$directoryName');
      currentLocation = myDir;
      originLocation = myDir;
      dirs = currentLocation.listSync();
      print(originLocation.path);
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
    if (choosenDirs.contains(f))
      choosenDirs.remove(f);
    else
      choosenDirs.add(f);
    notifyListeners();
  }

  void deleteChoosen() {
    for (var e in choosenDirs) {
      dirs.remove(e);
      e.deleteSync();
    }
    choosenDirs.clear();
    notifyListeners();
  }

  void openFile(FileSystemEntity f) {
    if (f is Directory) {
      currentLocation = f;
      dirs = currentLocation.listSync();
      choosenDirs.clear();
      notifyListeners();
    }
  }

  void getBack() {
    currentLocation = currentLocation.parent;
    dirs = currentLocation.listSync();
    choosenDirs.clear();
    notifyListeners();
  }

  void renameFile(FileSystemEntity f, String s) {
    if (f is Directory) {
      var dir = f.parent.path;
      var newPath = dir + '/' + s;
      f.rename(newPath).then((value) {
        dirs = currentLocation.listSync();
      });
    }
    notifyListeners();
  }
}
