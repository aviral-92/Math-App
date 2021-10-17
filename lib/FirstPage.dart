import 'package:MathApp/SecondPage.dart';
import 'package:flutter/material.dart';

class FirstPage extends StatelessWidget {
  final controllerThousand = new TextEditingController();
  final controllerHundred = new TextEditingController();
  final controllerTens = new TextEditingController();
  final controllerOnes = new TextEditingController();
  final controllerDistribution = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MATH-APP'),
      ),
      body: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Enter the number',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Thousands'),
                Text('Hundreds'),
                Text('Tens'),
                Text('Ones'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getContainer(controllerThousand),
                _getContainer(controllerHundred),
                _getContainer(controllerTens),
                _getContainer(controllerOnes),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Enter number of envelopes',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getContainer(controllerDistribution),
                RaisedButton(
                  color: Colors.blue,
                  onPressed: () {
                    String number;
                    if (controllerThousand.text != null &&
                        controllerHundred.text != null &&
                        controllerTens.text != null &&
                        controllerOnes.text != null) {
                      number = controllerThousand.text +
                          controllerHundred.text +
                          controllerTens.text +
                          controllerOnes.text;
                    }
                    Navigator.of(context).pushReplacement(
                      MaterialPageRoute(
                        builder: (context) => SecondPage(
                          controllerThousand: controllerThousand,
                          controllerHundred: controllerHundred,
                          controllerTens: controllerTens,
                          controllerOnes: controllerOnes,
                          controllerDistribution: controllerDistribution,
                          originalNumber: number,
                        ),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      Text(
                        'Next Page',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                      Icon(
                        Icons.arrow_right,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ],
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
            maxLength: 1,
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
}
