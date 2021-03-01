import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class MiddleRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;

  const MiddleRow(
      {Key key,
      this.controllerThousand,
      this.controllerHundred,
      this.controllerTens,
      this.controllerOnes})
      : super(key: key);
  @override
  _MiddleRowState createState() => _MiddleRowState(this.controllerThousand,
      this.controllerHundred, this.controllerTens, this.controllerOnes);
}

class _MiddleRowState extends State<MiddleRow> {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;

  double x = 0.0;
  double y = 0.0;

  _MiddleRowState(this._controllerThousand, this._controllerHundred,
      this._controllerTens, this._controllerOnes);

  @override
  void initState() {
    super.initState();
    _controllerThousand.addListener(() => setState(() {}));
    _controllerHundred.addListener(() => setState(() {}));
    _controllerTens.addListener(() => setState(() {}));
    _controllerOnes.addListener(() => setState(() {}));
  }

  void _updateLocation(PointerEvent details) {
    print('Enter.........');
    setState(() {
      x = details.position.dx;
      y = details.position.dy;
    });
    print('${x.toStringAsFixed(2)}');
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Align(
        alignment: Alignment.topCenter,
        child: ConstrainedBox(
          constraints:
              BoxConstraints.tight(Size(MediaQuery.of(context).size.width, 75)),
          child: MouseRegion(
            //onHover: _updateLocation,
            onEnter: (PointerEnterEvent event) {
              print('x: ${event.position.dx}, y: ${event.position.dy}');
            },
            onHover: (PointerHoverEvent event) {
              print('x: ${event.position.dx}, y: ${event.position.dy}');
            },
            onExit: (PointerExitEvent event) {
              print('x: ${event.position.dx}, y: ${event.position.dy}');
            },
            child: Container(
              //color: Colors.amber,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Text("hello: ${x.toStringAsFixed(2)}"),
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
                      print('x axis: ${x.toStringAsFixed(2)}');
                      return Draggable<String>(
                        data: "ThousandDollar",
                        axis: Axis.horizontal,
                        //dragAnchor: DragAnchor.pointer,
                        child: _getGenericContainerWidget(
                            'assets/images/ThousandDollarStack.jpg',
                            'assets/images/ThousandDollar.jpg',
                            _controllerThousand),
                        feedback: _getContainerMiddleRow(
                            'assets/images/ThousandDollar.jpg', true),
                      );
                    },
                  ),
                  /************************************************************* */
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
                            'assets/images/HundredDollar.jpg', true),
                      );
                    },
                  ),
                  /******************************************************* */

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
                            'assets/images/TenDollarStack.jpg', true),
                      );
                    },
                  ),
                  /******************************************************* */
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
                            'assets/images/OneDollar.jpg', true),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
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
}
