import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/WordsData.dart';
import 'package:japp_app/screens/creation_screen.dart';
import 'package:provider/provider.dart';

class WordsScreen extends StatelessWidget {
  static const String id = 'words_screen';

  @override
  Widget build(BuildContext context) {
    return Consumer<WordsData>(builder: (context, wordsData, child) {
      List<Widget> act1 = [
        IconButton(
          icon: const Icon(Icons.add),
          tooltip: 'Добавить папку',
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  String name;
                  return AlertDialog(
                    title: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Введите название папки...',
                      ),
                      onChanged: (val) {
                        name = val;
                      },
                    ),
                    actions: [
                      TextButton(
                        child: Text('Ок'),
                        onPressed: () {
                          wordsData.createFolder(name);
                          Navigator.of(context).pop();
                          print(name);
                        },
                      ),
                      TextButton(
                        child: Text('Отмена'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ];

      List<Widget> act2 = [
        IconButton(
          icon: const Icon(Icons.delete_forever_sharp),
          tooltip: 'Удалить выбранное',
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: Text("Подтвердите удаление"),
                    actions: [
                      TextButton(
                        child: Text('Да'),
                        onPressed: () {
                          wordsData.deleteChoosen();
                          Navigator.of(context).pop();
                        },
                      ),
                      TextButton(
                        child: Text('Нет'),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                      ),
                    ],
                  );
                });
          },
        ),
      ];

      return WillPopScope(
        onWillPop: () async {
          if (wordsData.currentLocation.path == wordsData.originLocation.path) {
            Navigator.of(context).pop();
          } else {
            wordsData.getBack();
          }
          return false;
        },
        child: Scaffold(
          floatingActionButton: ElasticIn(
            duration: Duration(milliseconds: 400),
            child: FloatingActionButton.extended(
              icon: const Icon(
                Icons.navigation,
              ),
              backgroundColor: Colors.green,
              label: const Text('Новый тест'),
              onPressed: () {
                Navigator.pushNamed(context, CreationScreen.id);
              },
            ),
          ),
          appBar: AppBar(
            title: Text('Архив'),
            actions: wordsData.choosenDirs.isEmpty ? act1 : act2,
          ),
          body: ListView.separated(
            separatorBuilder: (BuildContext context, int index) =>
                const Divider(),
            padding: const EdgeInsets.all(12),
            itemCount: wordsData.dirs.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(wordsData.dirs[index].path.split('/').last),
                leading: Icon(Icons.folder),
                trailing: Checkbox(
                  value: wordsData.choosenDirs.contains(wordsData.dirs[index]),
                  onChanged: (value) {
                    wordsData.chooseFile(wordsData.dirs[index]);
                    print('ssss');
                  },
                ),
                onTap: () {
                  wordsData.openFile(wordsData.dirs[index]);
                },
                onLongPress: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        String name;
                        return AlertDialog(
                          title: TextField(
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              hintText: 'Введите новое имя папки...',
                            ),
                            onChanged: (val) {
                              name = val;
                            },
                          ),
                          actions: [
                            TextButton(
                              child: Text('Ок'),
                              onPressed: () {
                                wordsData.renameFile(
                                    wordsData.dirs[index], name);
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text('Отмена'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      });
                },
              );
            },
          ),
        ),
      );
    });
  }
}
