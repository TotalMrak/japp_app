import 'package:flutter/material.dart';
import 'package:japp_app/Models/Card.dart';
import 'package:japp_app/screens/abc_test.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/Quiz.dart';

class ArchiveCard extends StatelessWidget {
  ArchiveCard({@required this.card});

  final QCard card;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Column(
        children: [Text('${card.dateTime.day}'), Text('${card.progress}%')],
      ),
      onPressed: () {
        Provider.of<Quiz>(context, listen: false).quizFromCardCreate(card);
        Navigator.pushNamed(context, ABCTestScreen.id);
      },
    );
  }
}
