import 'package:MathApp/FirstPage.dart';
import 'package:MathApp/Rows/MiddleRow.dart';
import 'package:flutter/material.dart';
import 'modal/ModalController.dart';

class SecondPage extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final TextEditingController controllerDistribution;
  final originalNumber;

  const SecondPage({
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

class _SingleDesign extends State<SecondPage> {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final TextEditingController controllerDistribution;
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
//
  List<TextEditingController> hundredsList = List();

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
    setState(() {
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

      for (int i = 0; i < int.parse(controllerDistribution.text); i++) {
        hundredsList.add(new TextEditingController(text: '0'));
      }
    });
    super.initState();
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
            fontSize: MediaQuery.of(context).size.width > 900 ? 32 : 22,
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
                fontSize: MediaQuery.of(context).size.width < 900 ? 20 : 30,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        ],
      ),
      drawer: getDrawer(),
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
                child: Padding(
                  padding: EdgeInsets.all(
                      MediaQuery.of(context).size.width > 900 ? 22 : 0),
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
            ),
            MiddleRow(
              controllerThousand: this.controllerThousand,
              controllerHundred: this.controllerHundred,
              controllerTens: this.controllerTens,
              controllerOnes: this.controllerOnes,
              modalControllerList: modalControllerList,
              controllerDistribution: controllerDistribution,
              hundredsList: hundredsList,
              //num: ,
            ),
          ],
        ),
      ),
    );
  }

  Widget _getContainer(TextEditingController controller) {
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width < 900 ? 75 : 100,
        child: TextField(
          //maxLength: 5,
          style: TextStyle(
            fontSize: width < 900 ? 21 : 34,
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
  }

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
        builder: (_) => _alertDialog('You did it.'),
        barrierDismissible: true,
      );
    } else {
      showDialog(
        context: context,
        builder: (_) => _alertDialog('Error, try again'),
        barrierDismissible: true,
      );
    }
    print(
        'Quotient = $quotient && Remainder = $remainder && Result Quotient = $resultQuotient && controllerThousand = $resultRemainder');
    //print(originalNumber);
  }

  Widget _alertDialog(String num) => AlertDialog(
        title: Text('$num'),
        content: Text('$num!!!'),
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

  getDrawer() => Container(
        width: MediaQuery.of(context).size.width - 75,
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
                    left: 75,
                  ),
                  child: GestureDetector(
                    onTap: () {
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  SizedBox(height: 20.0),
                  ExpansionTile(
                    title: Text(
                      'Instructions',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 45),
                        child: Text(
                          'On the Island of Decigona, there are only \$1 bills, \$10 bills, \$100 bills, and \$1,000 bills. ' +
                              'Grandma Walker often sends money to her grandchildren. She always gives the same amount to each ' +
                              'grandchild. Figure out how many of each bill will go into each envelope. ' +
                              'Larger bills can be exchanged for a smaller unit by dragging to the right.',
                          style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 22,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 8,
                    left: 75,
                  ),
                  child: GestureDetector(
                    onTap: () {},
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
      );
}
