import 'package:flutter/material.dart';

class RowTextItem extends StatelessWidget {
  final String lable;
  final String content;
  final Color colorContent;
  const RowTextItem(
      {Key? key,
      required this.lable,
      required this.content,
      this.colorContent = const Color(0xFF444444)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Row(children: <Widget>[
        Container(
          width: 100.0,
          child: Text(
            lable.isNotEmpty ? lable + " " : "",
            style: new TextStyle(color: Color(0xFF535858), fontSize: 12),
          ),
        ),
        Flexible(
          child: Text(
            content,
            style: new TextStyle(color: colorContent, fontSize: 12),
            maxLines: 4,
          ),
        ),
      ]),
    );
  }
}
