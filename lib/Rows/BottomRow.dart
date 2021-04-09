import 'package:MathApp/modal/ModalController.dart';
import 'package:flutter/material.dart';

class BottomRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;

  const BottomRow(
      {Key key,
      this.controllerThousand,
      this.controllerHundred,
      this.controllerTens,
      this.controllerOnes})
      : super(key: key);
  @override
  _BottomRowState createState() => _BottomRowState(
      controllerThousand, controllerHundred, controllerTens, controllerOnes);
}

class _BottomRowState extends State<BottomRow> {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;
  final controllerDistribution = new TextEditingController();

  ModalController modalController1 = new ModalController();
  ModalController modalController2 = new ModalController();
  ModalController modalController3 = new ModalController();
  ModalController modalController4 = new ModalController();
  ModalController modalController5 = new ModalController();
  ModalController modalController6 = new ModalController();
  ModalController modalController7 = new ModalController();
  ModalController modalController8 = new ModalController();
  ModalController modalController9 = new ModalController();

  _BottomRowState(this._controllerThousand, this._controllerHundred,
      this._controllerTens, this._controllerOnes);
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
                onEditingComplete: () => {print('object')},
              ),
            ),
            getWrap(controllerDistribution.text),
            /*Wrap(
              spacing: 13.0,
              alignment: WrapAlignment.start,
              children: getList(controllerDistribution.text),
            ),*/
          ],
        ),
      ),
    );
  }

  Widget getWrap(String num) {
    if (num.isEmpty) {
      return Container();
    }
    int number = int.parse(num);
    return Wrap(
      spacing: 13.0,
      alignment: WrapAlignment.start,
      children: [
        number > 0
            ? () {
                number--;
                return getContainer(1, modalController1);
              }()
            : Container(),
        number > 0
            ? () {
                number--;
                return getContainer(2, modalController2);
              }()
            : Container(),
        number > 0
            ? () {
                number--;
                return getContainer(3, modalController3);
              }()
            : Container(),
        number > 0
            ? () {
                number--;
                return getContainer(4, modalController4);
              }()
            : Container(
                height: 80,
                width: 70,
              ),
        number > 0
            ? () {
                number--;
                return getContainer(5, modalController5);
              }()
            : Container(
                height: 80,
                width: 70,
              ),
        number > 0
            ? () {
                number--;
                return getContainer(6, modalController6);
              }()
            : Container(
                height: 80,
                width: 70,
              ),
        number > 0
            ? () {
                number--;
                return getContainer(7, modalController7);
              }()
            : Container(
                height: 80,
                width: 70,
              ),
        number > 0
            ? () {
                number--;
                return getContainer(8, modalController8);
              }()
            : Container(
                height: 80,
                width: 70,
              ),
        number > 0
            ? () {
                number--;
                return getContainer(9, modalController9);
              }()
            : Container(
                height: 80,
                width: 70,
              ),
      ],
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
                data: 'TenDollar$key',
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
    } else {
      int oneValue = int.parse(_controllerOnes.text);
      _controllerOnes.text = (oneValue - 1).toString();
    }
    changeText(key, data);
  }

  changeText(int key, String data) {
    setState(() {
      switch (key) {
        case 1:
          textChange(data, modalController1);
          break;
        case 2:
          textChange(data, modalController2);
          break;
        case 3:
          textChange(data, modalController3);
          break;
        case 4:
          textChange(data, modalController4);
          break;
        case 5:
          textChange(data, modalController5);
          break;
        case 6:
          textChange(data, modalController6);
          break;
        case 7:
          textChange(data, modalController7);
          break;
        case 8:
          textChange(data, modalController8);
          break;
        case 9:
          textChange(data, modalController9);
          break;
      }
    });
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
    } else {
      modalController.onesController.text =
          (int.parse(modalController.onesController.text) + 1).toString();
    }
  }
}
