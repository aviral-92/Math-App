import 'package:MathApp/FirstPage.dart';
import 'package:MathApp/Rows/MiddleRow.dart';
import 'package:flutter/material.dart';
import 'Rows/BottomRow.dart';
import 'modal/ModalController.dart';

class SingleDesign extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final controllerDistribution;
  final originalNumber;

  const SingleDesign({
    Key key,
    this.controllerThousand,
    this.controllerHundred,
    this.controllerTens,
    this.controllerOnes,
    this.controllerDistribution,
    this.originalNumber,
  }) : super(key: key);
  @override
  _SingleDesign createState() => _SingleDesign(
        this.controllerThousand,
        this.controllerHundred,
        this.controllerTens,
        this.controllerOnes,
        this.controllerDistribution,
        this.originalNumber,
      );
}

class _SingleDesign extends State<SingleDesign> {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final controllerDistribution;
  final originalNumber;

  ModalController modalController1 = new ModalController();
  ModalController modalController2 = new ModalController();
  ModalController modalController3 = new ModalController();
  ModalController modalController4 = new ModalController();
  ModalController modalController5 = new ModalController();
  ModalController modalController6 = new ModalController();
  ModalController modalController7 = new ModalController();
  ModalController modalController8 = new ModalController();
  ModalController modalController9 = new ModalController();

  List<ModalController> modalControllerList;

  _SingleDesign(
    this.controllerThousand,
    this.controllerHundred,
    this.controllerTens,
    this.controllerOnes,
    this.controllerDistribution,
    this.originalNumber,
  );

  @override
  void initState() {
    super.initState();
    modalControllerList = [
      modalController1,
      modalController2,
      modalController3,
      modalController4,
      modalController5,
      modalController6,
      modalController7,
      modalController8,
      modalController9,
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: Text(
          'Math-App',
          style: TextStyle(
            fontWeight: FontWeight.w700,
          ),
        ),
        elevation: 6,
        actions: [
          FlatButton(
            onPressed: () {
              fun();
            },
            child: Text(
              'Result',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      drawer: Container(
        width: 230, //MediaQuery.of(context).size.width - 250,
        height: double.infinity,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 28,
                    left: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //print('object');
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => FirstPage()));
                    },
                    child: Text(
                      'Reset',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //print('object');
                    },
                    child: Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 20,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      //print('object');
                    },
                    child: Text(
                      'Exit',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
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
              modalControllerList: modalControllerList,
            ),
            /* ***************Bottom ROW STARTS*********** */
            BottomRow(
              controllerThousand: controllerThousand,
              controllerHundred: controllerHundred,
              controllerTens: controllerTens,
              controllerOnes: controllerOnes,
              modalControllerList: this.modalControllerList,
              controllerDistribution: this.controllerDistribution,
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
            controller: controller,
            //enabled: false,
            readOnly: true,
          ),
        ),
      );

  void fun() {
    int num = int.parse(originalNumber);
    int quotient = num ~/ int.parse(controllerDistribution.text);
    int remainder = num % int.parse(controllerDistribution.text);

    String resultQuotientString =
        modalControllerList[0].thousandController.text +
            modalControllerList[0].hundredController.text +
            modalControllerList[0].tensController.text +
            modalControllerList[0].onesController.text;
    int resultQuotient = int.parse(resultQuotientString);

    String resultRemainderString = controllerThousand.text +
        controllerHundred.text +
        controllerTens.text +
        controllerOnes.text;
    int resultRemainder = int.parse(resultRemainderString);

    if (quotient == resultQuotient && remainder == resultRemainder) {
      showDialog(
        context: context,
        builder: (_) => _alertDialog('Success'),
        barrierDismissible: true,
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => _alertDialog('Fail'),
        barrierDismissible: true,
      );
    }
    print(
        'Quotient = $quotient && Remainder = $remainder && Result Quotient = $resultQuotient && controllerThousand = $resultRemainder');
    //print(originalNumber);
  }

  Widget _alertDialog(String num) => AlertDialog(
        title: Text('$num'),
        content: Text('You got $num!!!'),
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
