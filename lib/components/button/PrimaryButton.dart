import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final Function()? press;
  final Color color, textColor;
  const PrimaryButton({
    Key? key,
    required this.text,
    this.press,
    this.color = buttonTextColor,
    this.textColor = primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(17, 0, 18, 0),
      width: double.infinity,
      height: defaultButtonHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(defaultButtonRadius),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: color,
            textStyle: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: defaultButtonText),
          ),
          onPressed: press,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: textColor,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
