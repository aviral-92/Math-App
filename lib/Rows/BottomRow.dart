import 'package:MathApp/modal/ModalController.dart';
import 'package:flutter/material.dart';

class BottomRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;

  final List<ModalController> modalControllerList;

  const BottomRow({
    Key key,
    this.controllerThousand,
    this.controllerHundred,
    this.controllerTens,
    this.controllerOnes,
    this.modalControllerList,
  }) : super(key: key);
  @override
  _BottomRowState createState() => _BottomRowState(
        this.controllerThousand,
        this.controllerHundred,
        this.controllerTens,
        this.controllerOnes,
        this.modalControllerList,
      );
}

class _BottomRowState extends State<BottomRow> {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;
  final controllerDistribution = new TextEditingController();

  final List<ModalController> modalControllerList;

  _BottomRowState(
    this._controllerThousand,
    this._controllerHundred,
    this._controllerTens,
    this._controllerOnes,
    this.modalControllerList,
  );
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                controller: controllerDistribution,
              ),
            ),
            getWrap(controllerDistribution.text),
          ],
        ),
      ),
    );
  }

  List<Widget> getWrapLoop(int num) {
    List<Widget> list = new List();

    for (int i = 0; i < num; i++) {
      list.add(getContainer(i + 1, modalControllerList[i]));
    }
    for (int i = 0; i < 9 - num; i++) {
      list.add(Container(width: 70));
    }
    return list;
  }

  Widget getWrap(String num) {
    if (num.isEmpty) {
      return Container();
    }
    return Wrap(
      spacing: 13.0,
      alignment: WrapAlignment.start,
      children: getWrapLoop(int.parse(num)),
    );
  }

  Widget getContainer(int key, ModalController controller) {
    return Container(
      key: ValueKey(key),
      height: 80,
      width: 70,
      child: Column(
        children: [
          DragTarget<String>(
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              setState(() {
                _forBill(data, key);
              });
            },
            builder: (context, acceptData, rejectData) {
              return Draggable<String>(
                data: 'ThousandDollar$key',
                child: _getInnerContainer(
                    Colors.green, controller.thousandController),
                feedback: _getInnerContainer(
                    Colors.green, controller.thousandController),
              );
            },
          ),
          /*****************************BLUE*********************************** */
          DragTarget<String>(
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              setState(() {
                _forBill(data, key);
              });
            },
            builder: (context, acceptData, rejectData) {
              return Draggable<String>(
                data: 'HundredDollar$key',
                child: _getInnerContainer(
                    Colors.blue, controller.hundredController),
                feedback: _getInnerContainer(
                    Colors.blue, controller.hundredController),
              );
            },
          ),
          /*****************************PINK*********************************** */
          DragTarget<String>(
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              setState(() {
                _forBill(data, key);
              });
            },
            builder: (context, acceptData, rejectData) {
              return Draggable<String>(
                data: 'TenDollar$key',
                child: _getInnerContainer(
                    Colors.pink[100], controller.tensController),
                feedback: _getInnerContainer(
                    Colors.pink[100], controller.tensController),
              );
            },
          ),
          /*****************************YELLOW*********************************** */
          DragTarget<String>(
            onWillAccept: (data) {
              return true;
            },
            onAccept: (data) {
              setState(() {
                _forBill(data, key);
              });
            },
            builder: (context, acceptData, rejectData) {
              return Draggable<String>(
                data: 'OneDollar$key',
                child: _getInnerContainer(
                    Colors.yellow, controller.onesController),
                feedback: _getInnerContainer(
                    Colors.yellow, controller.onesController),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _getInnerContainer(Color color, TextEditingController txt) {
    return Container(
      height: 20,
      width: 70,
      color: color,
      child: getText(txt),
    );
  }

  Widget getText(TextEditingController controller) {
    return Text(
      controller.text,
      style: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w900,
        color: Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }

  void _forBill(String data, int key) {
    print(data);
    if (data == 'ThousandDollar') {
      int thousandValue = int.parse(_controllerThousand.text);
      _controllerThousand.text = (thousandValue - 1).toString();
    } else if (data == 'HundredDollar') {
      int hundredValue = int.parse(_controllerHundred.text);
      _controllerHundred.text = (hundredValue - 1).toString();
    } else if (data == 'TenDollar') {
      int tenValue = int.parse(_controllerTens.text);
      _controllerTens.text = (tenValue - 1).toString();
    } else if (data == 'OneDollar') {
      int oneValue = int.parse(_controllerOnes.text);
      _controllerOnes.text = (oneValue - 1).toString();
    }
    changeText(key, data);
  }

  changeText(int key, String data) {
    setState(
      () {
        for (int i = 0; i < 9; i++) {
          if (key == i + 1) {
            textChange(data, modalControllerList[i]);
            break;
          }
        }
      },
    );
  }

  void textChange(String data, ModalController modalController) {
    if (data == 'ThousandDollar') {
      modalController.thousandController.text =
          (int.parse(modalController.thousandController.text) + 1).toString();
    } else if (data == 'HundredDollar') {
      modalController.hundredController.text =
          (int.parse(modalController.hundredController.text) + 1).toString();
    } else if (data == 'TenDollar') {
      modalController.tensController.text =
          (int.parse(modalController.tensController.text) + 1).toString();
    } else if (data == 'OneDollar') {
      modalController.onesController.text =
          (int.parse(modalController.onesController.text) + 1).toString();
    }
  }
}
