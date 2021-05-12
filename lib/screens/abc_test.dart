import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/ArchiveData.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:japp_app/screens/ABCResultsScreen.dart';
import 'package:japp_app/screens/ArchiveScreen.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Widgets/NumericBar.dart';
import 'package:japp_app/Widgets/AnswerOptions.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class ABCTestScreen extends StatelessWidget {
  static const String id = 'abctest_screen';

  @override
  Widget build(BuildContext context) {
    final ItemScrollController controller = ItemScrollController();
    var questNum = Provider.of<Quiz>(context)
        .questList[Provider.of<Quiz>(context).selectedNum - 1];

    return WillPopScope(
      onWillPop: () async {
        Provider.of<ArchiveData>(context, listen: false).getArchive();
        Navigator.of(context).popAndPushNamed(ArchiveScreen.id);
        return false;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Padding(
          padding: EdgeInsets.only(top: 50, bottom: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                color: Colors.grey[100],
                height: 50,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: Provider.of<Quiz>(context).listLength,
                  itemBuilder: (context, index) => NumericBar(
                    num: index + 1,
                    controller: controller,
                  ),
                  itemScrollController: controller,
                ),
              ),
              SizedBox(
                height: 60,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 57),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30.0),
                          color: Colors.grey[300]),
                      width: double.infinity,
                      height: 100,
                      child: Center(
                        child: Text(
                          questNum.symbol,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              letterSpacing: 2.5),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    AnswerOptions(
                      option: questNum.variants[0],
                    ),
                    AnswerOptions(
                      option: questNum.variants[1],
                    ),
                    AnswerOptions(
                      option: questNum.variants[2],
                    ),
                    AnswerOptions(
                      option: questNum.variants[3],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: AnimatedOpacity(
                    opacity: questNum.hasAnswerGiven ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      width: double.infinity,
                      child: FloatingActionButton.extended(
                        backgroundColor: Provider.of<Quiz>(context).finishedQ !=
                                Provider.of<Quiz>(context).questList.length
                            ? Colors.blue
                            : Colors.green,
                        label: Icon(
                          Icons.arrow_forward_rounded,
                          size: 25,
                        ),
                        icon: Text(
                          Provider.of<Quiz>(context).finishedQ !=
                                  Provider.of<Quiz>(context).questList.length
                              ? 'Следующий вопрос'
                              : 'Завершить тест',
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 2.5),
                        ),
                        onPressed: () {
                          Provider.of<Quiz>(context, listen: false).nextNum();
                          controller.scrollTo(
                              index: Provider.of<Quiz>(context, listen: false)
                                      .selectedNum -
                                  1,
                              duration: Duration(seconds: 1),
                              alignment: 0.7,
                              curve: Curves.easeOut,
                              opacityAnimationWeights: const [20, 20, 60]);
                          if (Provider.of<Quiz>(context, listen: false)
                                  .finishedQ ==
                              Provider.of<Quiz>(context, listen: false)
                                  .questList
                                  .length)
                            Navigator.pushNamed(context, ABCResultsScreen.id);
                        },
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
