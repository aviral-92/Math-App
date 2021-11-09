import 'package:MathApp/modal/ModalController.dart';
import 'package:flutter/material.dart';

class CommonWidgets {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;
  final List<ModalController> modalControllerList;
  //final TextEditingController controllerDistribution;

  CommonWidgets(
    this._controllerThousand,
    this._controllerHundred,
    this._controllerTens,
    this._controllerOnes,
    this.modalControllerList,
    //this.controllerDistribution,
  );

  void forBill(String data, int key, BuildContext context) {
    //print('forBill====> $data');
    if (data == 'ThousandDollar') {
      int thousandValue = int.parse(_controllerThousand.text);
      if (thousandValue > 0) {
        _controllerThousand.text = (thousandValue - 1).toString();
        changeText(key, data);
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'HundredDollar') {
      //print('=====HundredDollar=====');
      int hundredValue = int.parse(_controllerHundred.text);
      if (hundredValue > 0) {
        _controllerHundred.text = (hundredValue - 1).toString();
        changeText(key, data);
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'TenDollar') {
      int tenValue = int.parse(_controllerTens.text);
      if (tenValue > 0) {
        _controllerTens.text = (tenValue - 1).toString();
        changeText(key, data);
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'OneDollar') {
      int oneValue = int.parse(_controllerOnes.text);
      if (oneValue > 0) {
        _controllerOnes.text = (oneValue - 1).toString();
        changeText(key, data);
      } else {
        cannotSubtractFromZero(context);
      }
    }
  }

  void cannotSubtractFromZero(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) =>
          _alertDialog('you cannot move, bill is already zero.', context),
      barrierDismissible: true,
    );
  }

  changeText(int key, String data) {
    //print('KEY===> $key, DATA====> $data');

    for (int i = 0; i < 9; i++) {
      if (key == i + 1) {
        textChange(data, modalControllerList[i]);
        break;
      }
    }
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

  Widget _alertDialog(String num, BuildContext context) => AlertDialog(
        title: Text('Invalid Move!'),
        content: Text('$num'),
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

  void forThousand(String data, BuildContext context, int radioValue) {
    int thousandValue = _controllerThousand.text.isEmpty
        ? 0
        : int.parse(_controllerThousand.text);
    if (data == 'HundredDollar') {
      int hundredsValue = int.parse(_controllerHundred.text);
      if (hundredsValue < 10) {
        showDialog(
          context: context,
          builder: (_) =>
              _alertDialog('Sorry, bill is less than \$10', context),
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
          builder: (_) =>
              _alertDialog('Sorry, bill is less than \$100', context),
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
          builder: (_) =>
              _alertDialog('Sorry, bill is less than \$1000', context),
          barrierDismissible: true,
        );
      } else {
        _controllerOnes.text = (onesValue - 1000).toString();
        _controllerThousand.text = (thousandValue + 1).toString();
      }
    }
    forThousandBottomRow(data, context);
  }

  void forThousandBottomRow(String data, BuildContext context) {
    //print('==>>>>>>>DATA-> $data');
    //test(data);
    for (int i = 0; i < 9; i++) {
      if (data == 'ThousandDollar${i + 1}') {
        if (int.parse(modalControllerList[i].thousandController.text) > 0) {
          int value =
              int.parse(modalControllerList[i].thousandController.text) - 1;
          modalControllerList[i].thousandController = new TextEditingController(
            text: value.toString(),
          );

          int thousandValue = _controllerThousand.text.isEmpty
              ? 0
              : int.parse(_controllerThousand.text);
          _controllerThousand.text = (thousandValue + 1).toString();
          break;
        } else {
          showDialog(
            context: context,
            builder: (_) => _alertDialog(
                'you cannot move, value is already zero.', context),
            barrierDismissible: true,
          );
        }
      }
    }
  }

  void forHundred(String data, BuildContext context, int radioValue) {
    //print('000001---->$radioValue, DATA====> $data');
    int hundredValue = _controllerHundred.text.isEmpty
        ? 0
        : int.parse(_controllerHundred.text);
    if (data == 'ThousandDollar') {
      int thousandValue = int.parse(_controllerThousand.text);
      if (thousandValue > 0) {
        _controllerThousand.text = (thousandValue - 1).toString();
        _controllerHundred.text = (hundredValue + 10).toString();
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'TenDollar') {
      if (radioValue != 0) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog(
              'Please select left radio button to move left.', context),
          barrierDismissible: true,
        );
      } else {
        int tensValue = int.parse(_controllerTens.text);
        if (tensValue < 10) {
          showDialog(
            context: context,
            builder: (_) =>
                _alertDialog('Sorry, bill is less than \$10', context),
            barrierDismissible: true,
          );
        } else {
          _controllerTens.text = (tensValue - 10).toString();
          _controllerHundred.text = (hundredValue + 1).toString();
        }
      }
    } else if (data == 'OneDollar') {
      int onesValue = int.parse(_controllerOnes.text);
      if (onesValue < 100) {
        showDialog(
          context: context,
          builder: (_) =>
              _alertDialog('Sorry, bill is less than \$100', context),
          barrierDismissible: true,
        );
      } else {
        _controllerOnes.text = (onesValue - 100).toString();
        _controllerHundred.text = (hundredValue + 1).toString();
      }
    }
    forHundredBottomRow(data, context);
  }

  void forHundredBottomRow(String data, BuildContext context) {
    //print('object---> $data');
    for (int i = 0; i < 9; i++) {
      if (data == 'HundredDollar${i + 1}') {
        if (int.parse(modalControllerList[i].hundredController.text) > 0) {
          modalControllerList[i].hundredController.text =
              (int.parse(modalControllerList[i].hundredController.text) - 1)
                  .toString();
          int hundredValue = _controllerHundred.text.isEmpty
              ? 0
              : int.parse(_controllerHundred.text);
          _controllerHundred.text = (hundredValue + 1).toString();
          break;
        } else {
          showDialog(
            context: context,
            builder: (_) => _alertDialog(
                'you cannot move, value is already zero.', context),
            barrierDismissible: true,
          );
        }
      }
    }
  }

  void forTen(String data, BuildContext context, int radioValue) {
    int tensValue =
        _controllerTens.text.isEmpty ? 0 : int.parse(_controllerTens.text);
    if (data == 'ThousandDollar') {
      if (int.parse(_controllerThousand.text) > 0) {
        _controllerThousand.text =
            (int.parse(_controllerThousand.text) - 1).toString();
        _controllerTens.text = (tensValue + 100).toString();
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'HundredDollar') {
      if (radioValue != 1) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog(
              'Please select right radio button to move.', context),
          barrierDismissible: true,
        );
      } else {
        if (int.parse(_controllerHundred.text) > 0) {
          _controllerHundred.text =
              (int.parse(_controllerHundred.text) - 1).toString();
          _controllerTens.text = (tensValue + 10).toString();
        } else {
          cannotSubtractFromZero(context);
        }
      }
    } else if (data == 'OneDollar') {
      int onesValue = int.parse(_controllerOnes.text);
      if (onesValue < 10) {
        showDialog(
          context: context,
          builder: (_) =>
              _alertDialog('Sorry, bill is less than \$10', context),
          barrierDismissible: true,
        );
      } else {
        _controllerOnes.text = (onesValue - 10).toString();
        _controllerTens.text = (tensValue + 1).toString();
      }
    }
    _forTensBottomRow(data, context);
  }

  void _forTensBottomRow(String data, BuildContext context) {
    for (int i = 0; i < 9; i++) {
      if (data == 'TenDollar${i + 1}') {
        if (int.parse(modalControllerList[i].tensController.text) > 0) {
          modalControllerList[i].tensController.text =
              (int.parse(modalControllerList[i].tensController.text) - 1)
                  .toString();
          int tensValue = _controllerTens.text.isEmpty
              ? 0
              : int.parse(_controllerTens.text);
          _controllerTens.text = (tensValue + 1).toString();
          break;
        } else {
          showDialog(
            context: context,
            builder: (_) => _alertDialog(
                'you cannot move, value is already zero.', context),
            barrierDismissible: true,
          );
        }
      }
    }
  }

  void forOne(String data, BuildContext context, int radioValue) {
    int onesValue =
        _controllerOnes.text.isEmpty ? 0 : int.parse(_controllerOnes.text);
    if (data == 'ThousandDollar') {
      if (int.parse(_controllerThousand.text) > 0) {
        _controllerThousand.text =
            (int.parse(_controllerThousand.text) - 1).toString();
        _controllerOnes.text = (onesValue + 1000).toString();
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'HundredDollar') {
      if (int.parse(_controllerHundred.text) > 0) {
        _controllerHundred.text =
            (int.parse(_controllerHundred.text) - 1).toString();
        _controllerOnes.text = (onesValue + 100).toString();
      } else {
        cannotSubtractFromZero(context);
      }
    } else if (data == 'TenDollar') {
      if (radioValue != 1) {
        showDialog(
          context: context,
          builder: (_) => _alertDialog(
              'you cannot move, please select right radio button to move right.',
              context),
          barrierDismissible: true,
        );
      } else {
        if (int.parse(_controllerTens.text) > 0) {
          _controllerTens.text =
              (int.parse(_controllerTens.text) - 1).toString();
          _controllerOnes.text = (onesValue + 10).toString();
        } else {
          cannotSubtractFromZero(context);
        }
      }
    }
    _forOnesBottomRow(data, context);
  }

  void _forOnesBottomRow(String data, BuildContext context) {
    for (int i = 0; i < 9; i++) {
      if (data == 'OneDollar${i + 1}') {
        if (int.parse(modalControllerList[i].onesController.text) > 0) {
          modalControllerList[i].onesController.text =
              (int.parse(modalControllerList[i].onesController.text) - 1)
                  .toString();
          int onesValue = _controllerOnes.text.isEmpty
              ? 0
              : int.parse(_controllerOnes.text);
          _controllerOnes.text = (onesValue + 1).toString();
          break;
        } else {
          showDialog(
            context: context,
            builder: (_) => _alertDialog(
                'you cannot move, value is already zero.', context),
            barrierDismissible: true,
          );
        }
      }
    }
  }

  Widget getDragTarget(String data, String stackImg, String img, Function fun,
      BuildContext context, int radio, TextEditingController controller) {
    double width = MediaQuery.of(context).size.width;
    return DragTarget<String>(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        fun(data, context, radio);
        //print('Done again... $data');
      },
      builder: (context, acceptData, rejectData) {
        return Draggable<String>(
          data: data,
          child: _getGenericContainerWidget(stackImg, img, controller, width),
          feedback: _getContainerMiddleRow(img, true, width),
        );
      },
    );
  }

  Widget _getGenericContainerWidget(String imgStack, String img,
      TextEditingController myController, double width) {
    //print('myController.text --> ${myController.text}');
    return Container(
      width: width < 900 ? 95 : 150,
      height: width < 900 ? 70 : 105,
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

  Widget _getContainerMiddleRow(String img, bool isImg, double width) =>
      Container(
        width: width < 900 ? 95 : 150,
        height: width < 900 ? 70 : 105,
        decoration: isImg
            ? BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(img),
                  fit: BoxFit.cover,
                ),
              )
            : BoxDecoration(),
      );

  Widget getInnerContainer(
      Color color, TextEditingController txt, double width) {
    return Container(
      height: 20,
      width: 70,
      color: color,
      child: _getText(txt, width),
    );
  }

  Widget _getText(TextEditingController controller, double width) {
    return Text(
      controller.text,
      style: TextStyle(
        fontSize: width < 900 ? 16 : 28,
        fontWeight: FontWeight.w800,
        color: Colors.black87,
      ),
      textAlign: TextAlign.center,
    );
  }
}
