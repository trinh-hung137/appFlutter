import 'package:flutter/material.dart';

class RowTextView extends StatelessWidget {
  final String lable;
  final String content;
  final int flexItemLeft;
  final int flexItemRight;
  final String? iconButtonUrl;
  final Color? color1;
  final Color? color2;

  RowTextView({
    Key? key,
    required this.lable,
    required this.content,
    required this.flexItemLeft,
    required this.flexItemRight,
    this.iconButtonUrl,
    this.color1,
    this.color2,
  }) : super(key: key);

  RowTextView.withButton({
    Key? key,
    required this.lable,
    required this.content,
    required this.flexItemLeft,
    required this.flexItemRight,
    required this.iconButtonUrl,
    this.color1,
    this.color2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Row(
          children: <Widget>[
            Expanded(
              flex: flexItemLeft,
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  lable,
                  style: new TextStyle(
                    color: color1 ?? Color(0xFF535858),
                    fontSize: 14,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            Expanded(
              flex: flexItemRight,
              child: Text(
                content,
                style: new TextStyle(
                  color: color2 ?? Color(0xFF444444),
                  fontSize: 14,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ],
        ),
        SizedBox(
          height: 16.0,
        ),
      ],
    );
  }
}
