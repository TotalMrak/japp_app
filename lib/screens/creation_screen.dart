import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/WordsData.dart';
import 'package:provider/provider.dart';

import '../Models/CreationData.dart';

class CreationScreen extends StatefulWidget {
  static final apiKey = 'AIzaSyCKybm470JLEPixG7-W0QzacqD7cF0WnLU';
  static const String id = "Creation_Screen";
  @override
  _CreationScreenState createState() => _CreationScreenState();
}

class _CreationScreenState extends State<CreationScreen> {
  var txt = TextEditingController();
  var txt2 = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<CreationData>(builder: (context, creationData, child) {
      return Scaffold(
        floatingActionButton: ElasticIn(
          duration: Duration(milliseconds: 400),
          child: FloatingActionButton.extended(
            icon: const Icon(
              Icons.create,
            ),
            backgroundColor: Colors.green,
            label: const Text('Завершить'),
            onPressed: () {
              if (creationData.creation.values.toSet().length < 4) {
                summonSnackBar(context, 'Добавьте минимум 4 перевода');
              } else {
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      String name;
                      return AlertDialog(
                        title: TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: 'Введите название файла',
                          ),
                          onChanged: (val) {
                            name = val;
                          },
                        ),
                        actions: [
                          TextButton(
                            child: Text('Ок'),
                            onPressed: () {
                              var check =
                                  Provider.of<WordsData>(context, listen: false)
                                      .createFile(name, creationData.creation);
                              if (check) {
                                Provider.of<WordsData>(context, listen: false)
                                    .getFiles();
                                Navigator.of(context).pop();
                                Navigator.of(context).pop();
                              } else {
                                summonSnackBar(context, 'Файл уже существует!');
                              }
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
              }
            },
          ),
        ),
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          backgroundColor: Colors.indigo[400],
          title: Text('Создайте свой список'),
        ),
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 3),
                child: Column(
                  children: [
                    TextField(
                      controller: txt,
                      onChanged: (value) {
                        creationData.offField();
                      },
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(20)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.purple),
                            borderRadius: BorderRadius.circular(20)),
                        labelStyle: TextStyle(
                          color: Color(0xFF6200EE),
                        ),
                        hintText: 'Новое слово',
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width / 1.4,
                          child: TextField(
                            controller: txt2,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              hintText: 'Перевод',
                            ),
                          ),
                        ),
                        IconButton(
                          tooltip: 'Онлайн-перевод',
                          icon: Icon(Icons.change_history),
                          color: creationData.fieldEnabled
                              ? Colors.redAccent
                              : Colors.green,
                          onPressed: () async {
                            if (!creationData.fieldEnabled) {
                              creationData.toggleField();
                              try {
                                txt2.text =
                                    await creationData.translateToJap(txt.text);
                              } catch (e) {
                                try {
                                  txt2.text = await creationData
                                      .translateFromGoogle(txt.text);
                                } catch (e) {
                                  summonSnackBar(context, "Ошибка сети");
                                }
                              }
                            }
                          },
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        if (creationData.creation.containsKey(txt.text)) {
                          summonSnackBar(context, "Слово уже добавлено!");
                        }
                        creationData.addWord(txt.text, txt2.text);
                      },
                      child: Text('Добавить слово'),
                      style: ElevatedButton.styleFrom(primary: Colors.green),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1, horizontal: 3),
                  child: ListView.separated(
                    shrinkWrap: true,
                    separatorBuilder: (BuildContext context, int index) =>
                        const Divider(),
                    itemCount: creationData.creation.length,
                    itemBuilder: (context, index) {
                      String key = creationData.creation.keys.elementAt(index);
                      return ListTile(
                        title: Text("$key"),
                        subtitle: new Text("${creationData.creation[key]}"),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete_forever_sharp,
                            color: Colors.redAccent,
                          ),
                          onPressed: () {
                            creationData.removeWord(key);
                          },
                        ),
                      );
                    },
                  )),
            ),
          ],
        ),
      );
    });
  }
}

void summonSnackBar(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text(
      text,
      textAlign: TextAlign.center,
    ),
    duration: const Duration(milliseconds: 1100),
    behavior: SnackBarBehavior.floating,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10.0),
    ), // Width of the SnackBar.
    width: 250,
  ));
}
