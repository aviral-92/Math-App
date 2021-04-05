//import 'package:MathApp/Rows/BottomRow.dart';
import 'package:MathApp/Rows/MiddleRow.dart';
import 'package:flutter/material.dart';

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
                    DragTarget<int>(
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            cases(data, controllerThousand);
                          },
                        );
                      },
                      builder: (context, acceptData, rejectData) {
                        return _getContainer(controllerThousand);
                      },
                    ),
                    DragTarget<int>(
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            cases(data, controllerHundred);
                          },
                        );
                      },
                      builder: (context, acceptData, rejectData) {
                        return _getContainer(controllerHundred);
                      },
                    ),
                    DragTarget<int>(
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            cases(data, controllerTens);
                          },
                        );
                      },
                      builder: (context, acceptData, rejectData) {
                        return _getContainer(controllerTens);
                      },
                    ),
                    DragTarget<int>(
                      onWillAccept: (data) {
                        return true;
                      },
                      onAccept: (data) {
                        setState(
                          () {
                            cases(data, controllerOnes);
                          },
                        );
                      },
                      builder: (context, acceptData, rejectData) {
                        return _getContainer(controllerOnes);
                      },
                    ),
                    //_getContainer(controllerThousand),
                    //_getContainer(controllerHundred),
                    //_getContainer(controllerTens),
                    //_getContainer(controllerOnes),
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
            Expanded(
              flex: 4,
              child: Align(
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 50,
                      child: TextField(
                        //maxLength: 5,
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
                        controller: controllerDistribution,
                      ),
                    ),
                    //if(controllerDistribution.text.length)
                    // getStackOfDistributions().first,
                  ],
                ),
              ),
            ),

            //BottomRow(),
          ],
        ),
      ),
    );
  }

  List<Widget> getStackOfDistributions() {
    var txt = controllerDistribution.text;
    List<Widget> list = new List();
    if (txt.length > 0) {
      int num = int.parse(txt);
      for (int i = 0; i < num; i++) {
        var c = Container(
          height: 80,
          width: 70,
          child: Column(
            children: [
              Container(
                height: 20,
                color: Colors.green,
              ),
              Container(
                height: 20,
                color: Colors.blue,
              ),
              Container(
                height: 20,
                color: Colors.pink[100],
              ),
              Container(
                height: 20,
                color: Colors.yellow,
              ),
            ],
          ),
        );
        list.add(c);
      }
    }
    return list;
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
      //print('i is : $i');
      if (i == data) {
        myController.text =
            myController.text.isEmpty || myController.text == '0'
                ? i.toString()
                : '${myController.text}$i';
        break;
      }
    }
    /*switch (data) {
      case 0:
        myController.text =
            myController.text.isEmpty || myController.text == '0'
                ? '0'
                : '${myController.text}0';
        break;
      case 1:
        controllerThousand.text =
            controllerThousand.text.isEmpty || controllerThousand.text == '0'
                ? '1'
                : '${myController.text}1';
        break;
      case 2:
        controllerThousand.text =
            controllerThousand.text.isEmpty || controllerThousand.text == '0'
                ? '2'
                : '${myController.text}2';
        break;
    }*/
  }
}
