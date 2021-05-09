import 'package:flutter/material.dart';
import 'package:japp_app/Models/ArchiveData.dart';
import 'package:japp_app/Models/CreationData.dart';
import 'package:japp_app/screens/ArchiveScreen.dart';
import 'package:japp_app/screens/abc_screen.dart';
import 'package:japp_app/screens/abc_test.dart';
import 'package:japp_app/screens/creation_screen.dart';
import 'package:japp_app/screens/menu_screen.dart';
import 'package:japp_app/screens/words_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/DataProv.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'screens/ABCResultsScreen.dart';
import 'package:flutter/services.dart';
import 'package:japp_app/Models/WordsData.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainData>(
          create: (context) => MainData(),
        ),
        ChangeNotifierProvider<Quiz>(
          create: (context) => Quiz(),
        ),
        ChangeNotifierProvider(
          create: (context) => ArchiveData(),
        ),
        ChangeNotifierProvider(
          create: (context) => WordsData(),
        ),
        ChangeNotifierProvider(
          create: (context) => CreationData(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.indigo[50],
          fontFamily: 'Ubuntu',
          appBarTheme: AppBarTheme(color: Colors.redAccent[700]),
        ),
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          ABCScreen.id: (context) => ABCScreen(),
          WordsScreen.id: (context) => WordsScreen(),
          ABCTestScreen.id: (context) => ABCTestScreen(),
          ABCResultsScreen.id: (context) => ABCResultsScreen(),
          ArchiveScreen.id: (context) => ArchiveScreen(),
          CreationScreen.id: (context) => CreationScreen(),
        },
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case 'abc_screen':
              return PageTransition(
                  child: ABCScreen(),
                  type: PageTransitionType.rightToLeftWithFade);
              break;
            default:
              return null;
          }
        },
      ),
    );
  }
}
