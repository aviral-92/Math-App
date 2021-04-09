import 'package:MathApp/Rows/MiddleRow.dart';
import 'package:flutter/material.dart';

import 'Rows/BottomRow.dart';

class SingleDesign extends StatefulWidget {
  @override
  _SingleDesign createState() => _SingleDesign();
}

class _SingleDesign extends State<SingleDesign> {
  final controllerThousand = new TextEditingController();
  final controllerHundred = new TextEditingController();
  final controllerTens = new TextEditingController();
  final controllerOnes = new TextEditingController();
  final controllerDistribution = new TextEditingController();

  @override
  void initState() {
    super.initState();
    controllerThousand.addListener(() => setState(() {}));
    controllerHundred.addListener(() => setState(() {}));
    controllerTens.addListener(() => setState(() {}));
    controllerOnes.addListener(() => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Math-App'),
      ),
      body: SafeArea(
        top: false,
        bottom: false,
        child: Column(
          children: [
            /* ***************FIRST ROW STARTS*********** */
            Expanded(
              flex: 3,
              child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _getContainer(controllerThousand),
                    _getContainer(controllerHundred),
                    _getContainer(controllerTens),
                    _getContainer(controllerOnes),
                  ],
                ),
              ),
            ),
            /* ***************Middle ROW STARTS*********** */
            MiddleRow(
              controllerThousand: this.controllerThousand,
              controllerHundred: this.controllerHundred,
              controllerTens: this.controllerTens,
              controllerOnes: this.controllerOnes,
            ),
            /* ***************Bottom ROW STARTS*********** */
            BottomRow(
              controllerThousand: controllerThousand,
              controllerHundred: controllerHundred,
              controllerTens: controllerTens,
              controllerOnes: controllerOnes,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContainer(TextEditingController controller) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 75,
          child: TextField(
            maxLength: 5,
            style: TextStyle(
              fontSize: 21,
            ),
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
            controller: controller,
          ),
        ),
      );

  void cases(int data, TextEditingController myController) {
    for (int i = 0; i < 10; i++) {
      if (i == data) {
        myController.text =
            myController.text.isEmpty || myController.text == '0'
                ? i.toString()
                : '${myController.text}$i';
        break;
      }
    }
  }
}
