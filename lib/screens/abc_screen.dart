import 'package:flutter/material.dart';
import 'package:japp_app/Widgets/Bar.dart';
import 'package:japp_app/constants.dart';
import 'package:japp_app/screens/abc_test.dart';
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
        padding: EdgeInsets.only(left: 5, right: 5, bottom: 2),
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
                RandButton(),
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
                Provider.of<Quiz>(context, listen: false).quizCreate();
                Navigator.pushNamed(context, ABCTestScreen.id);
              },
              child: Hero(
                tag: '123',
                child: Container(
                  color: Provider.of<MainData>(context, listen: false)
                          .selectedKatakana
                          .isNotEmpty
                      ? Colors.red
                      : Colors.red[100],
                  width: double.infinity,
                  height: 80.0,
                  child: Center(
                    child: Text('Начать тест'),
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
