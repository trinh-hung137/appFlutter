import 'package:flutter/material.dart';

class CustomTextCheckbox extends StatelessWidget {
  final bool checkIcon;
  final String text;
  final VoidCallback onpress;
  final int left;
  final int right;
  final bool checkDetail;
  CustomTextCheckbox(
      {Key? key,
        required this.checkIcon,
        required this.text,
        required this.onpress,
        this.left = 2,
        this.right = 3,
        this.checkDetail = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 30,
            alignment: Alignment.centerLeft,
            child: Text(text,
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF535858),
                )),
          ),
          flex: left,
        ),
        Expanded(
          flex: right,
          child: Row(children: [
            GestureDetector(
              onTap: onpress,
              child: Container(
                  width: 18,
                  height: 18,
                  // alignment: Alignment.center,
                  decoration: BoxDecoration(
                      border:
                      Border.all(color: Color(0xFF6F9BD4), width: 1.5),
                      borderRadius: BorderRadius.circular(4),
                      color:
                      checkDetail == false ? Color(0xFFCBCBCB) : null),
                  child: checkIcon == true
                      ? Icon(Icons.check,
                      size: 14, color: Color(0xFF6F9BD4))
                      : null),
            ),
          ]),
        )
      ],
    );
  }
}
