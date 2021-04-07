import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:japp_app/Models/ArchiveData.dart';
import 'package:japp_app/screens/ArchiveScreen.dart';
import 'package:japp_app/screens/abc_screen.dart';
import 'package:japp_app/Widgets/MainButton.dart';
import 'package:provider/provider.dart';
import 'package:animate_do/animate_do.dart';
import 'package:url_launcher/url_launcher.dart';

class MainScreen extends StatelessWidget {
  static const String id = 'menu_screen';

  String _url = 'https://github.com/TotalMrak/japp_app';
  void _launchURL() async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 13, vertical: 30),
        child: FadeInUp(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Align(
                alignment: Alignment.bottomRight,
                child: IconButton(
                  icon: Icon(Icons.info),
                  iconSize: 30,
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Github:\n'
                                'https://github.com/TotalMrak/japp_app'),
                            actions: [
                              TextButton(
                                child: Text('Перейти'),
                                onPressed: () {
                                  _launchURL();
                                  Navigator.of(context).pop();
                                },
                              ),
                              TextButton(
                                child: Text('Вернуться'),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                              ),
                            ],
                          );
                        });
                  },
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: MainButton(
                        colour: Colors.white,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Image(
                              alignment: Alignment.centerRight,
                              fit: BoxFit.cover,
                              image: AssetImage('assets/book.png'),
                              height: 70,
                              width: 70,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'カタカナ'
                            '\nひらがな',
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontSize: 18),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.grey[200],
                            ),
                            child: Text(
                              'Азбука',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.lightBlueAccent,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        onTap: () {
                          Navigator.pushNamed(context, ABCScreen.id);
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: MainButton(
                        colour: Colors.lightBlue,
                        children: [
                          Container(
                            padding: EdgeInsets.only(top: 10),
                            child: Image(
                              fit: BoxFit.cover,
                              image: AssetImage('assets/notepad.png'),
                              height: 70,
                              width: 70,
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            '期待',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          Container(
                            padding: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              color: Colors.lightBlue[300],
                            ),
                            child: Text(
                              'Слова',
                              style: TextStyle(
                                fontSize: 25,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                        onTap: () {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                            content: const Text(
                              "В процессе разработки...",
                              textAlign: TextAlign.center,
                            ),
                            duration: const Duration(seconds: 2),
                            behavior: SnackBarBehavior.floating,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ), // Width of the SnackBar.
                            width: 250,
                          ));
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                child: Text(
                  'Первый шаг '
                  '\nк Японии',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 50),
                ),
              ),
              MainButton(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Архив',
                        style: TextStyle(
                          fontSize: 50,
                          color: Colors.white,
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 100, top: 10),
                        child: Image(
                          alignment: Alignment.centerRight,
                          fit: BoxFit.cover,
                          image: AssetImage('assets/books.png'),
                          height: 70,
                          width: 70,
                        ),
                      ),
                    ],
                  )
                ],
                colour: Colors.green,
                onTap: () {
                  Provider.of<ArchiveData>(context, listen: false).getArchive();
                  Navigator.pushNamed(context, ArchiveScreen.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
