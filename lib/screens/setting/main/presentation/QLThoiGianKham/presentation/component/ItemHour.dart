import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HourItemList extends StatelessWidget {
  const HourItemList(
      {Key? key,
      required this.stt,
      required this.tgian,
      required this.isCheck,
      required this.onItemClick})
      : super(key: key);
  final String stt;
  final String tgian;
  final String isCheck;
  final Function(bool) onItemClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: IntrinsicHeight(
        child: GestureDetector(
          onTap: () {
            onItemClick(isCheck == 'true' ? false : true);
          },
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Center(
                        child: Icon(
                      isCheck == 'true'
                          ? Icons.check_box_outlined
                          : Icons.crop_square_sharp,
                      size: 18,
                    ))),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Center(
                        child: Text(stt, style: TextStyle(fontSize: 12)))),
              ),
              Expanded(
                child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey, width: 0.5)),
                    child: Center(
                        child: Text(tgian, style: TextStyle(fontSize: 12)))),
              )
            ],
          ),
        ),
      ),
    );
  }
}
