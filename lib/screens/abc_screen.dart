import 'package:flutter/material.dart';
import 'package:japp_app/Widgets/Bar.dart';
import 'package:japp_app/constants.dart';
import 'package:japp_app/screens/abc_test.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/DataProv.dart';
import 'package:japp_app/Widgets/ChooseButton.dart';
import 'package:japp_app/Widgets/RandButton.dart';
import 'package:japp_app/Models/Quiz.dart';

class ABCScreen extends StatelessWidget {
  static const String id = 'abc_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: <Widget>[
          PopupMenuButton(
            itemBuilder: (BuildContext context) {
              return choices
                  .map((String s) =>
                      PopupMenuItem<String>(value: s, child: Text(s)))
                  .toList();
            },
            onSelected: (String s) {
              if (s == "Катакана")
                showDialog(
                    context: context,
                    builder: (_) => Dialog(
                            child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(),
                          child: PhotoView(
                            imageProvider: AssetImage('assets/Katakana.jpg'),
                            backgroundDecoration: BoxDecoration(),
                          ),
                        )));
              else
                showDialog(
                    context: context,
                    builder: (_) => Dialog(
                            child: Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(),
                          child: PhotoView(
                            imageProvider: AssetImage('assets/Hiragana.jpg'),
                            backgroundDecoration: BoxDecoration(),
                          ),
                        )));
            },
          )
        ],
        backgroundColor: Colors.indigo[400],
        title: Text(
          "Выберите символы",
          style: TextStyle(
              color: Colors.white70,
              fontFamily: 'YanoneKaffeesatz',
              fontWeight: FontWeight.bold,
              letterSpacing: 2.5),
        ),
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 5),
        child: Column(
          children: [
            Expanded(
              flex: 9,
              child: GridView.count(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  children: List.generate(15, (index) {
                    return Bar(line: SoundsEng[index]);
                  })),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  children: [
                    RandButton(),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<MainData>(context, listen: false)
                            .clearAll();
                      },
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.amber),
                      ),
                      child: Text(
                        "Сброс",
                        style: TextStyle(
                          fontFamily: 'YanoneKaffeesatz',
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      ChooseButton(
                        line: 'Катакана',
                        colorActive: Colors.blue,
                        checkPressed: Provider.of<MainData>(context).katakanaOn,
                        onTap: () {
                          Provider.of<MainData>(context, listen: false)
                              .changePressedKata();
                        },
                      ),
                      ChooseButton(
                        line: 'Хирагана',
                        colorActive: Colors.greenAccent,
                        checkPressed: Provider.of<MainData>(context).hiraganaOn,
                        onTap: () {
                          Provider.of<MainData>(context, listen: false)
                              .changePressedHira();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                if (Provider.of<MainData>(context, listen: false)
                    .checkLists()) {
                  Provider.of<Quiz>(context, listen: false).quizCreate();
                  Navigator.pushNamed(context, ABCTestScreen.id);
                }
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 500),
                color:
                    Provider.of<MainData>(context, listen: false).checkLists()
                        ? Colors.indigo[400]
                        : Colors.indigo[100],
                width: double.infinity,
                height: 80.0,
                child: Center(
                  child: Text(
                    'Начать тест',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 40,
                        fontFamily: 'YanoneKaffeesatz',
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
