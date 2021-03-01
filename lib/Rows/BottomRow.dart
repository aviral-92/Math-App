import 'package:flutter/material.dart';

class BottomRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Draggable<int>(
              data: 0,
              child: getContainer(Colors.orange, Colors.black, '0'),
              feedback: getContainer(Colors.orange, Colors.black, '0'),
            ),
            Draggable<int>(
              data: 1,
              child: getContainer(Colors.red, Colors.white, '1'),
              feedback: getContainer(Colors.red, Colors.white, '1'),
            ),
            Draggable<int>(
              data: 2,
              child: getContainer(Colors.green, Colors.black, '2'),
              feedback: getContainer(Colors.green, Colors.black, '2'),
            ),
            Draggable<int>(
              data: 3,
              child: getContainer(Colors.purple, Colors.white, '3'),
              feedback: getContainer(Colors.purple, Colors.white, '3'),
            ),
            Draggable<int>(
              data: 4,
              child: getContainer(Colors.blue, Colors.black, '4'),
              feedback: getContainer(Colors.blue, Colors.black, '4'),
            ),
            Draggable<int>(
              data: 5,
              child: getContainer(Colors.indigo, Colors.white, '5'),
              feedback: getContainer(Colors.indigo, Colors.white, '5'),
            ),
            Draggable<int>(
              data: 6,
              child: getContainer(Colors.yellow, Colors.black, '6'),
              feedback: getContainer(Colors.yellow, Colors.black, '6'),
            ),
            Draggable<int>(
              data: 7,
              child: getContainer(Colors.brown, Colors.white, '7'),
              feedback: getContainer(Colors.brown, Colors.white, '7'),
            ),
            Draggable<int>(
              data: 8,
              child: getContainer(Colors.cyan, Colors.black, '8'),
              feedback: getContainer(Colors.cyan, Colors.black, '8'),
            ),
            Draggable<int>(
              data: 9,
              child: getContainer(Colors.pink, Colors.white, '9'),
              feedback: getContainer(Colors.pink, Colors.white, '9'),
            ),
          ],
        ),
      ),
    );
  }

  Widget getContainer(Color color, Color fontColor, String txt) => Container(
        width: 55,
        //height: 60,
        child: Align(
          alignment: Alignment.center,
          child: Text(
            txt,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.w900,
              color: fontColor,
            ),
          ),
        ),
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );
}
