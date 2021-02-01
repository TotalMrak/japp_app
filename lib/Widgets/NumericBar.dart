import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:japp_app/Models/Quiz.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

class NumericBar extends StatelessWidget {
  NumericBar({this.num, this.controller});

  final int num;
  final ItemScrollController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Provider.of<Quiz>(context, listen: false).chooseNum(num);
      },
      child: Container(
        decoration: BoxDecoration(
            color: Provider.of<Quiz>(context).setColorNum(num),
            borderRadius: BorderRadius.all(Radius.circular(5)),
            border: Border.all(width: 0.5)),
        width: 45,
        height: 30,
        margin: EdgeInsets.symmetric(horizontal: 2),
        child: Center(
          child: Text(
            ('$num'),
            style: TextStyle(fontSize: 15),
          ),
        ),
      ),
    );
  }
}
