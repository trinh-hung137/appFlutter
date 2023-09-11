import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonCheck extends StatelessWidget {
  const ButtonCheck(
      {Key? key,
      required this.colorBackground,
      required this.colorborder,
      required this.isShowIcon,
      required this.colorCheck,
      this.onCLick})
      : super(key: key);
  final Color colorBackground;
  final Color colorborder;
  final Color colorCheck;
  final bool isShowIcon;
  final Function()? onCLick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onCLick!();
      },
      child: Container(
        height: 16,
        width: 16,
        decoration: BoxDecoration(
            color: colorBackground,
            border: Border.all(color: colorborder, width: 1),
            borderRadius: BorderRadius.circular(3)),
        child: Center(
          child: Visibility(
              visible: isShowIcon,
              child: Icon(
                Icons.check,
                color: colorCheck,
                size: 14,
              )),
        ),
      ),
    );
  }
}
