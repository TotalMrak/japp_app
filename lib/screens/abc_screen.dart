import 'package:flutter/material.dart';
import 'package:japp_app/Widgets/Bar.dart';
import 'package:japp_app/constants.dart';
import 'package:photo_view/photo_view.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/DataProv.dart';
import 'package:japp_app/Widgets/ChooseButton.dart';
import 'package:japp_app/Widgets/RandButton.dart';
import 'package:japp_app/Widgets/StartButton.dart';

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
            color: Color(0xFFf2f2f2),
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 1,
          ),
        ),
        elevation: 10,
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 0, right: 0, bottom: 0),
        child: Column(
          children: [
            SizedBox(
              height: 12,
            ),
            Expanded(
              flex: 83,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  ChooseButton(
                    line: 'Катакана',
                    colorActive: katakanaColour,
                    checkPressed: Provider.of<MainData>(context).katakanaOn,
                    onTap: () {
                      Provider.of<MainData>(context, listen: false)
                          .changePressedKata();
                    },
                  ),
                  ChooseButton(
                    line: 'Хирагана',
                    colorActive: hiraganaColour,
                    checkPressed: Provider.of<MainData>(context).hiraganaOn,
                    onTap: () {
                      Provider.of<MainData>(context, listen: false)
                          .changePressedHira();
                    },
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 46,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(child: RandButton()),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Provider.of<MainData>(context, listen: false)
                            .clearAll();
                      },
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Color(0xFF03A9F5)),
                          minimumSize: MaterialStateProperty.all(Size(148, 46)),
                          shape: MaterialStateProperty.all(
                              RoundedRectangleBorder(
                                  side: BorderSide(
                                      color: Colors.black45, width: 10.0),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30)))),
                          side: MaterialStateProperty.all(
                              BorderSide(width: 0.5))),
                      child: Text(
                        "Сброс",
                        style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: SizedBox())
                ],
              ),
            ),
            SizedBox(height: 9),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.yellow[700],
            ),
            Expanded(
              flex: 397,
              child: GridView.count(
                  childAspectRatio: 1.2,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 3,
                  children: List.generate(15, (index) {
                    return Bar(line: SoundsEng[index]);
                  })),
            ),
            Container(
              height: 2,
              width: double.infinity,
              color: Colors.yellow[700],
            ),
            StartButton(),
          ],
        ),
      ),
    );
  }
}
