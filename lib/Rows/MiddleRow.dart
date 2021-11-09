import '../Rows/BottomRow.dart';
import '../Widget/CommonWidgets.dart';
import '../modal/ModalController.dart';
import 'package:flutter/material.dart';

class MiddleRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final List<ModalController> modalControllerList;
  final TextEditingController controllerDistribution;
  final List<TextEditingController> hundredsList;

  const MiddleRow({
    Key key,
    this.controllerThousand,
    this.controllerHundred,
    this.controllerTens,
    this.controllerOnes,
    this.modalControllerList,
    this.controllerDistribution,
    this.hundredsList,
  }) : super(key: key);

  @override
  _MiddleRowState createState() => _MiddleRowState(
        this.controllerThousand,
        this.controllerHundred,
        this.controllerTens,
        this.controllerOnes,
        this.modalControllerList,
        this.controllerDistribution,
      );
}

class _MiddleRowState extends State<MiddleRow> {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;
  final List<ModalController> modalControllerList;
  final TextEditingController controllerDistribution;

  int _radioValueHundred;
  int _radioValueTens;
  int result;

  double width = 0;

  _MiddleRowState(
    this._controllerThousand,
    this._controllerHundred,
    this._controllerTens,
    this._controllerOnes,
    this.modalControllerList,
    this.controllerDistribution,
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
        Icon(Icons.arrow_back),
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
        Icon(Icons.arrow_forward),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    CommonWidgets cw = new CommonWidgets(
      _controllerThousand,
      _controllerHundred,
      _controllerTens,
      _controllerOnes,
      modalControllerList,
    );
    return Padding(
      padding: EdgeInsets.all(width > 900 ? 32 : 0),
      child: Container(
        height: width > 900 ? 550 : 300,
        child: Column(
          children: [
            Expanded(
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
                        cw.getDragTarget(
                            'ThousandDollar',
                            'assets/images/ThousandDollarStack.jpg',
                            'assets/images/ThousandDollar.jpg',
                            cw.forThousand,
                            context,
                            _radioValueTens,
                            _controllerThousand),
                      ],
                    ),
                    /************************************************************* */
                    Column(
                      children: [
                        Row(
                          children: [
                            getRadioButtons(_radioValueHundred,
                                _handleRadioValueHundredChange),
                          ],
                        ),
                        cw.getDragTarget(
                            'HundredDollar',
                            'assets/images/HundredDollarStack.jpg',
                            'assets/images/HundredDollar.jpg',
                            cw.forHundred,
                            context,
                            _radioValueTens,
                            _controllerHundred),
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
                        cw.getDragTarget(
                            'TenDollar',
                            'assets/images/TenDollarStack.jpg',
                            'assets/images/TenDollar.jpg',
                            cw.forTen,
                            context,
                            _radioValueTens,
                            _controllerTens),
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
                        cw.getDragTarget(
                            'OneDollar',
                            'assets/images/OneDollarStack.jpg',
                            'assets/images/OneDollar.jpg',
                            cw.forOne,
                            context,
                            _radioValueTens,
                            _controllerOnes)
                      ],
                    ),
                  ],
                ),
              ),
            ),
            /******************BOTTOM ROW**************************/
            BottomRow(
              controllerThousand: _controllerThousand,
              controllerHundred: _controllerHundred,
              controllerTens: _controllerTens,
              controllerOnes: _controllerOnes,
              controllerDistribution: controllerDistribution,
              modalControllerList: modalControllerList,
            ),
          ],
        ),
      ),
    );
  }
}
