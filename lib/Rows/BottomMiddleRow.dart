import 'package:MathApp/Widget/CommonWidgets.dart';
import 'package:MathApp/modal/ModalController.dart';
import 'package:flutter/material.dart';

class BottomMiddleRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final List<ModalController> modalControllerList;
  final TextEditingController controllerDistribution;
  final List<TextEditingController> hundredsList;

  const BottomMiddleRow({
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
  _BottomMiddleRowState createState() => _BottomMiddleRowState(
        this.controllerThousand,
        this.controllerHundred,
        this.controllerTens,
        this.controllerOnes,
        this.modalControllerList,
        this.controllerDistribution,
      );
}

class _BottomMiddleRowState extends State<BottomMiddleRow> {
  final _controllerThousand;
  final _controllerHundred;
  final _controllerTens;
  final _controllerOnes;
  final List<ModalController> modalControllerList;
  final TextEditingController controllerDistribution;

  int _radioValueHundred;
  int _radioValueTens;
  int result;

  _BottomMiddleRowState(
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
    print('_handleRadioValueHundredChange--> $_radioValueHundred');
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
    print('_handleRadioValueTensChange');
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
    CommonWidgets cw = new CommonWidgets(
        _controllerThousand,
        _controllerHundred,
        _controllerTens,
        _controllerOnes,
        modalControllerList,
        controllerDistribution);
    return Container(
      height: 300,
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
                          _radioValueTens),
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
                          _radioValueTens),
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
                          _radioValueTens),
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
                          _radioValueTens)
                    ],
                  ),
                ],
              ),
            ),
          ),
          /******************BOTTOM ROW**************************/
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
                    child: Column(
                      children: [
                        Icon(
                          Icons.mail,
                          color: Colors.green,
                        ),
                        TextField(
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
                          readOnly: true,
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width - 150,
                    child: ListView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        padding: const EdgeInsets.all(8),
                        itemCount: int.parse(this.controllerDistribution.text),
                        itemBuilder: (BuildContext ctx, int index) {
                          return Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Column(
                              children: [
                                Container(
                                  height: 20,
                                  width: 50,
                                  child: _getDragTarget(
                                    index + 1,
                                    modalControllerList[index]
                                        .thousandController,
                                    'ThousandDollar',
                                    Colors.green,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 50,
                                  child: _getDragTarget(
                                    index + 1,
                                    modalControllerList[index]
                                        .hundredController,
                                    'HundredDollar',
                                    Colors.blue,
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 50,
                                  child: _getDragTarget(
                                    index + 1,
                                    modalControllerList[index].tensController,
                                    'TenDollar',
                                    Colors.pink[100],
                                  ),
                                ),
                                Container(
                                  height: 20,
                                  width: 50,
                                  child: _getDragTarget(
                                    index + 1,
                                    modalControllerList[index].onesController,
                                    'OneDollar',
                                    Colors.yellow,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget _getDragTarget(
      int key, TextEditingController controller, String bill, Color color) {
    CommonWidgets cw = new CommonWidgets(
        _controllerThousand,
        _controllerHundred,
        _controllerTens,
        _controllerOnes,
        modalControllerList,
        controllerDistribution);
    return DragTarget<String>(
      onWillAccept: (data) {
        return true;
      },
      onAccept: (data) {
        setState(() {
          cw.forBill(data, key, context);
        });
      },
      builder: (context, acceptData, rejectData) {
        Widget w = cw.getInnerContainer(color, controller);
        return Draggable<String>(
          data: '$bill$key',
          child: w,
          feedback: w,
        );
      },
    );
  }
}
