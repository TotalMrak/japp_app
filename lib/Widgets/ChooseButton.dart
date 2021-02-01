import 'package:flutter/material.dart';

class ChooseButton extends StatelessWidget {
  ChooseButton({this.line, this.checkPressed, this.onTap, this.colorActive});

  final String line;
  final bool checkPressed;
  final Function onTap;
  final Color colorActive;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
        child: ElevatedButton(
          child: Center(
            child: Text(
              line,
              style: TextStyle(
                fontFamily: 'YanoneKaffeesatz',
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
          onPressed: onTap,
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(
                  checkPressed ? colorActive : Colors.blueGrey),
              minimumSize: MaterialStateProperty.all(Size(179, 83)),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20)))),
              side: MaterialStateProperty.all(BorderSide(width: 0.5))),
        ));
  }

  //return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 2.0),
//       child: Material(
//         borderRadius: BorderRadius.all(Radius.circular(20)),
//         elevation: checkPressed ? 5 : 10,
//         color: checkPressed ? colorActive : Colors.blueGrey,
//         child: MaterialButton(
//           onPressed: onTap,
//           minWidth: 179,
//           height: 83,
//           child: Center(
//             child: Text(
//               line,
//               style: TextStyle(
//                 fontFamily: 'YanoneKaffeesatz',
//                 fontSize: 30,
//                 color: checkPressed ? Colors.black : Colors.white,
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
}
