import 'package:MathApp/modal/ModalController.dart';
import 'package:flutter/material.dart';

class MiddleRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final List<ModalController> modalControllerList;

  const MiddleRow({
    Key key,
    this.controllerThousand,
    this.controllerHundred,
    this.controllerTens,
    this.controllerOnes,
    this.modalControllerList,
  }) : super(key: key);
  @override
  _MiddleRowState createState() => _MiddleRowState(
        this.controllerThousand,
        this.controllerHundred,
        this.controllerTens,
        this.controllerOnes,
        this.modalControllerList,
      );
}

class _MiddleRowState extends State<MiddleRow> {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;
  final List<ModalController> modalControllerList;

  int _radioValueHundred;
  int _radioValueTens;
  int result;

  _MiddleRowState(
    this._controllerThousand,
    this._controllerHundred,
    this._controllerTens,
    this._controllerOnes,
    this.modalControllerList,
  );

  @override
  void initState() {
    super.initState();
    _controllerThousand.addListener(() => setState(() {}));
    _controllerHundred.addListener(() => setState(() {}));
    _controllerTens.addListener(() => setState(() {}));
    _controllerOnes.addListener(() => setState(() {}));
  }

  void _handleRadioValueHundredChange(int value) {
    setState(() {
      _radioValueHundred = value;
      switch (_radioValueHundred) {
        case 0:
          result = _radioValueHundred;
          break;
        case 1:
          result = _radioValueHundred;
          break;
      }
    });
  }

  void _handleRadioValueTensChange(int value) {
    setState(() {
      _radioValueTens = value;
      switch (_radioValueHundred) {
        case 0:
          result = _radioValueTens;
          break;
        case 1:
          result = _radioValueTens;
          break;
      }
    });
  }

  Widget getRadioButtons(int _radioValue, Function fun) {
    return Row(
      children: [
        Radio(
          value: 0,
          groupValue: _radioValue,
          onChanged: fun,
        ),
        Radio(
          value: 1,
          groupValue: _radioValue,
          onChanged: fun,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 5,
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 49,
                    )
                  ],
                ),
                DragTarget<String>(
                  onWillAccept: (data) {
                    return true;
                  },
                  onAccept: (data) {
                    setState(() {
                      _forThousand(data);
                    });
                  },
                  builder: (context, acceptData, rejectData) {
                    return Draggable<String>(
                      data: "ThousandDollar",
                      child: _getGenericContainerWidget(
                          'assets/images/ThousandDollarStack.jpg',
                          'assets/images/ThousandDollar.jpg',
                          _controllerThousand),
                      feedback: _getContainerMiddleRow(
                          'assets/images/ThousandDollar.jpg', true),
                    );
                  },
                ),
              ],
            ),
            /************************************************************* */
            Column(
              children: [
                Row(
                  children: [
                    getRadioButtons(
                        _radioValueHundred, _handleRadioValueHundredChange),
                  ],
                ),
                DragTarget<String>(
                  onWillAccept: (data) {
                    return true;
                  },
                  onAccept: (data) {
                    setState(() {
                      _forHundred(data);
                    });
                  },
                  builder: (context, acceptData, rejectData) {
                    return Draggable(
                      data: 'HundredDollar',
                      child: _getGenericContainerWidget(
                          'assets/images/HundredDollarStack.jpg',
                          'assets/images/HundredDollar.jpg',
                          _controllerHundred),
                      feedback: _getContainerMiddleRow(
                          _radioValueHundred == 0
                              ? 'assets/images/HundredDollar.jpg'
                              : 'assets/images/HundredDollarStack.jpg',
                          true),
                    );
                  },
                ),
              ],
            ),
            /******************************************************* */

            Column(
              children: [
                Row(
                  children: [
                    getRadioButtons(
                        _radioValueTens, _handleRadioValueTensChange),
                  ],
                ),
                DragTarget<String>(
                  onWillAccept: (data) {
                    return true;
                  },
                  onAccept: (data) {
                    setState(() {
                      _forTen(data);
                    });
                  },
                  builder: (context, acceptData, rejectData) {
                    return Draggable<String>(
                      data: 'TenDollar',
                      child: _getGenericContainerWidget(
                          'assets/images/TenDollarStack.jpg',
                          'assets/images/TenDollar.jpg',
                          _controllerTens),
                      feedback: _getContainerMiddleRow(
                          _radioValueTens == 0
                              ? 'assets/images/TenDollarStack.jpg'
                              : 'assets/images/TenDollar.jpg',
                          true),
                    );
                  },
                ),
              ],
            ),
            /******************************************************* */

            Column(
              children: [
                Row(
                  children: [
                    SizedBox(
                      height: 49,
                    )
                  ],
                ),
                DragTarget<String>(
                  onWillAccept: (data) {
                    return true;
                  },
                  onAccept: (data) {
                    setState(() {
                      _forOne(data);
                    });
                  },
                  builder: (context, acceptData, rejectData) {
                    return Draggable<String>(
                      data: 'OneDollar',
                      child: _getGenericContainerWidget(
                          'assets/images/OneDollarStack.jpg',
                          'assets/images/OneDollar.jpg',
                          _controllerOnes),
                      feedback: _getContainerMiddleRow(
                          'assets/images/OneDollarStack.jpg', true),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget getContainer(String img, bool isImg) => Container(
        width: 95,
        height: 70,
        decoration: isImg
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(),
      );

  Widget _getContainerMiddleRow(String img, bool isImg) => Container(
        width: 95,
        height: 70,
        decoration: isImg
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(),
      );

  Widget _getGenericContainerWidget(
      String imgStack, String img, TextEditingController myController) {
    return Container(
      width: 95,
      height: 70,
      decoration: myController.text.isEmpty || int.parse(myController.text) == 0
          ? BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            )
          : BoxDecoration(
              image: DecorationImage(
                image: AssetImage(myController.text.isNotEmpty &&
                        int.parse(myController.text) > 1
                    ? imgStack
                    : img),
                fit: BoxFit.cover,
              ),
            ),
    );
  }

  void _forHundred(String data) {
    int hundredValue = _controllerHundred.text.isEmpty
        ? 0
        : int.parse(_controllerHundred.text);
    if (data == 'ThousandDollar') {
      int thousandValue = int.parse(_controllerThousand.text);
      _controllerThousand.text = (thousandValue - 1).toString();
      _controllerHundred.text = (hundredValue + 10).toString();
    } else if (data == 'TenDollar') {
      int tensValue = int.parse(_controllerTens.text);
      if (tensValue < 10) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog('10'),
          barrierDismissible: true,
        );
      } else {
        _controllerTens.text = (tensValue - 10).toString();
        _controllerHundred.text = (hundredValue + 1).toString();
      }
    } else if (data == 'OneDollar') {
      int onesValue = int.parse(_controllerOnes.text);
      if (onesValue < 100) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog('100'),
          barrierDismissible: true,
        );
      } else {
        _controllerOnes.text = (onesValue - 100).toString();
        _controllerHundred.text = (hundredValue + 1).toString();
      }
    }
    _forHundredBottomRow(data);
  }

  void _forThousand(String data) {
    int thousandValue = _controllerThousand.text.isEmpty
        ? 0
        : int.parse(_controllerThousand.text);
    if (data == 'HundredDollar') {
      int hundredsValue = int.parse(_controllerHundred.text);
      if (hundredsValue < 10) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog('10'),
          barrierDismissible: true,
        );
      } else {
        _controllerHundred.text = (hundredsValue - 10).toString();
        _controllerThousand.text = (thousandValue + 1).toString();
      }
    } else if (data == 'TenDollar') {
      int tensValue = int.parse(_controllerTens.text);
      if (tensValue < 100) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog('100'),
          barrierDismissible: true,
        );
      } else {
        _controllerTens.text = (tensValue - 100).toString();
        _controllerThousand.text = (thousandValue + 1).toString();
      }
    } else if (data == 'OneDollar') {
      int onesValue = int.parse(_controllerOnes.text);
      if (onesValue < 1000) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog('1000'),
          barrierDismissible: true,
        );
      } else {
        _controllerOnes.text = (onesValue - 1000).toString();
        _controllerThousand.text = (thousandValue + 1).toString();
      }
    }
    _forThousandBottomRow(data);
  }

  void _forTen(String data) {
    int tensValue =
        _controllerTens.text.isEmpty ? 0 : int.parse(_controllerTens.text);
    if (data == 'ThousandDollar') {
      _controllerThousand.text =
          (int.parse(_controllerThousand.text) - 1).toString();
      _controllerTens.text = (tensValue + 100).toString();
    } else if (data == 'HundredDollar') {
      _controllerHundred.text =
          (int.parse(_controllerHundred.text) - 1).toString();
      _controllerTens.text = (tensValue + 10).toString();
    } else if (data == 'OneDollar') {
      int onesValue = int.parse(_controllerOnes.text);
      if (onesValue < 10) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog('10'),
          barrierDismissible: true,
        );
      } else {
        _controllerOnes.text = (onesValue - 10).toString();
        _controllerTens.text = (tensValue + 1).toString();
      }
    }
    _forTensBottomRow(data);
  }

  void _forOne(String data) {
    int onesValue =
        _controllerOnes.text.isEmpty ? 0 : int.parse(_controllerOnes.text);
    if (data == 'ThousandDollar') {
      _controllerThousand.text =
          (int.parse(_controllerThousand.text) - 1).toString();
      _controllerOnes.text = (onesValue + 1000).toString();
    } else if (data == 'HundredDollar') {
      _controllerHundred.text =
          (int.parse(_controllerHundred.text) - 1).toString();
      _controllerOnes.text = (onesValue + 100).toString();
    } else if (data == 'TenDollar') {
      _controllerTens.text = (int.parse(_controllerTens.text) - 1).toString();
      _controllerOnes.text = (onesValue + 10).toString();
    }
    _forOnesBottomRow(data);
  }

  Widget _alertDialog(String num) => AlertDialog(
        title: Text('Invalid Move!'),
        content: Text('Sorry, bill is less than \$$num'),
        actions: [
          FlatButton(
            onPressed: () {
              Navigator.of(context, rootNavigator: true).pop();
            },
            child: Text('OK'),
          )
        ],
        elevation: 24,
      );

  void _forThousandBottomRow(String data) {
    for (int i = 0; i < 9; i++) {
      if (data == 'ThousandDollar${i + 1}') {
        modalControllerList[i].thousandController.text =
            (int.parse(modalControllerList[i].thousandController.text) - 1)
                .toString();
        int thousandValue = _controllerThousand.text.isEmpty
            ? 0
            : int.parse(_controllerThousand.text);
        _controllerThousand.text = (thousandValue + 1).toString();
        break;
      }
    }
  }

  void _forHundredBottomRow(String data) {
    for (int i = 0; i < 9; i++) {
      if (data == 'HundredDollar${i + 1}') {
        modalControllerList[i].hundredController.text =
            (int.parse(modalControllerList[i].hundredController.text) - 1)
                .toString();
        int hundredValue = _controllerHundred.text.isEmpty
            ? 0
            : int.parse(_controllerHundred.text);
        _controllerHundred.text = (hundredValue + 1).toString();
        break;
      }
    }
  }

  void _forTensBottomRow(String data) {
    for (int i = 0; i < 9; i++) {
      if (data == 'TenDollar${i + 1}') {
        modalControllerList[i].tensController.text =
            (int.parse(modalControllerList[i].tensController.text) - 1)
                .toString();
        int tensValue =
            _controllerTens.text.isEmpty ? 0 : int.parse(_controllerTens.text);
        _controllerTens.text = (tensValue + 1).toString();
        break;
      }
    }
  }

  void _forOnesBottomRow(String data) {
    for (int i = 0; i < 9; i++) {
      if (data == 'OneDollar${i + 1}') {
        modalControllerList[i].onesController.text =
            (int.parse(modalControllerList[i].onesController.text) - 1)
                .toString();
        int onesValue =
            _controllerOnes.text.isEmpty ? 0 : int.parse(_controllerOnes.text);
        _controllerOnes.text = (onesValue + 1).toString();
        break;
      }
    }
  }
}
