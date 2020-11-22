import 'package:flutter/material.dart';
import 'package:japp_app/screens/abc_screen.dart';
import 'package:japp_app/screens/abc_test.dart';
import 'package:japp_app/screens/menu_screen.dart';
import 'package:japp_app/screens/words_screen.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/DataProv.dart';
import 'package:japp_app/Models/Quiz.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<MainData>(
          create: (context) => MainData(),
        ),
        ChangeNotifierProxyProvider<MainData, Quiz>(
          create: (BuildContext context) =>
              Quiz(Provider.of<MainData>(context, listen: false)),
          update: (BuildContext context, MainData mainData, Quiz quiz) =>
              Quiz(mainData),
        ),
      ],
      child: MaterialApp(
        initialRoute: MainScreen.id,
        routes: {
          MainScreen.id: (context) => MainScreen(),
          ABCScreen.id: (context) => ABCScreen(),
          WordsScreen.id: (context) => WordsScreen(),
          ABCTestScreen.id: (context) => ABCTestScreen(),
        },
      ),
    );
  }
}
