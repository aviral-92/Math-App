import '../Widget/CommonWidgets.dart';
import '../modal/ModalController.dart';
import 'package:flutter/material.dart';

class BottomRow extends StatefulWidget {
  final controllerThousand;
  final controllerHundred;
  final controllerTens;
  final controllerOnes;
  final List<ModalController> modalControllerList;
  final TextEditingController controllerDistribution;

  const BottomRow(
      {Key key,
      this.controllerThousand,
      this.controllerHundred,
      this.controllerTens,
      this.controllerOnes,
      this.modalControllerList,
      this.controllerDistribution})
      : super(key: key);

  @override
  _BottomRowState createState() => _BottomRowState();
}

class _BottomRowState extends State<BottomRow> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Expanded(
      flex: 4,
      child: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            setEnvelop(width),
            Container(
              width: width - 150,
              child: getListViewBuilder(width),
            ),
          ],
        ),
      ),
    );
  }

  Widget getListViewBuilder(double width) {
    return ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.all(8),
        itemCount: int.parse(this.widget.controllerDistribution.text),
        itemBuilder: (BuildContext ctx, int index) {
          return Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Column(
              children: [
                getBottomRowContainer(
                    index,
                    widget.modalControllerList[index].thousandController,
                    Colors.green,
                    'ThousandDollar',
                    width),
                getBottomRowContainer(
                    index,
                    widget.modalControllerList[index].hundredController,
                    Colors.blue,
                    'HundredDollar',
                    width),
                getBottomRowContainer(
                    index,
                    widget.modalControllerList[index].tensController,
                    Colors.pink[100],
                    'TenDollar',
                    width),
                getBottomRowContainer(
                    index,
                    widget.modalControllerList[index].onesController,
                    Colors.yellow,
                    'OneDollar',
                    width),
              ],
            ),
          );
        });
  }

  Widget getBottomRowContainer(int index, TextEditingController controller,
      Color color, String bill, double width) {
    return Container(
      height: width < 900 ? 20 : 35,
      width: width < 900 ? 50 : 80,
      child: _getDragTarget(index + 1, controller, bill, color),
    );
  }

  Widget setEnvelop(double width) {
    return Container(
      width: width > 900 ? 70 : 50,
      child: Column(
        children: [
          Icon(
            Icons.mail,
            color: Colors.green,
            size: width < 900 ? 28 : 48,
          ),
          TextField(
            maxLength: 1,
            style: TextStyle(
              fontSize: width < 900 ? 21 : 36,
            ),
            decoration: InputDecoration(
              border: new OutlineInputBorder(
                borderSide: new BorderSide(
                  color: Colors.teal,
                ),
              ),
            ),
            controller: widget.controllerDistribution,
            readOnly: true,
          ),
        ],
      ),
    );
  }

  Widget _getDragTarget(
      int key, TextEditingController controller, String bill, Color color) {
    CommonWidgets cw = new CommonWidgets(
        widget.controllerThousand,
        widget.controllerHundred,
        widget.controllerTens,
        widget.controllerOnes,
        widget.modalControllerList);
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
        Widget w = cw.getInnerContainer(
            color, controller, MediaQuery.of(context).size.width);
        return Draggable<String>(
          data: '$bill$key',
          child: w,
          feedback: w,
        );
      },
    );
  }
}
