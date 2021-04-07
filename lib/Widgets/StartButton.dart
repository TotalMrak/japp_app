import 'package:flutter/material.dart';
import 'package:japp_app/Models/ArchiveData.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:japp_app/screens/abc_test.dart';
import 'package:japp_app/Models/DataProv.dart';

class StartButton extends StatelessWidget {
  const StartButton({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 10.0),
        child: ElevatedButton(
          child: Center(
            child: Text(
              'Начать тест',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.5),
            ),
          ),
          onPressed: () {
            if (Provider.of<MainData>(context, listen: false).checkLists()) {
              Provider.of<Quiz>(context, listen: false)
                  .quizCreate(Provider.of<MainData>(context, listen: false));
              Provider.of<ArchiveData>(context, listen: false).getArchive();
              Navigator.popAndPushNamed(context, ABCTestScreen.id);
            }
          },
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                Provider.of<MainData>(context, listen: false).checkLists()
                    ? Colors.indigo[400]
                    : Colors.indigo[100],
              ),
              minimumSize: MaterialStateProperty.all(Size(179, 83)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25)))),
              side: MaterialStateProperty.all(BorderSide(width: 0.5))),
        ));
  }
}

//Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
//       child: GestureDetector(
//         onTap: () {
//           if (Provider.of<MainData>(context, listen: false).checkLists()) {
//             Provider.of<Quiz>(context, listen: false).quizCreate();
//             Navigator.pushNamed(context, ABCTestScreen.id);
//           }
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 500),
//           color: Provider.of<MainData>(context, listen: false).checkLists()
//               ? Colors.indigo[400]
//               : Colors.indigo[100],
//           width: double.infinity,
//           height: 80.0,
//           child: Center(
//             child: Text(
//               'Начать тест',
//               style: TextStyle(
//                   color: Colors.white,
//                   fontSize: 40,
//                   fontWeight: FontWeight.bold,
//                   letterSpacing: 2.5),
//             ),
//           ),
//         ),
//       ),
//     )
