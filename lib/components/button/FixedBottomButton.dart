import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';

class FixedBottomButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final bool iconDisplay;
  final bool border;
  final double fontSize, iconSize, spaceIconText, height;
  final Function()? press;
  final Color color, textColor, iconColor;
  const FixedBottomButton({
    Key? key,
    required this.text,
    required this.icon,
    this.iconDisplay = true,
    this.fontSize = 14,
    this.iconSize = 14,
    this.iconColor = Colors.white,
    this.spaceIconText = 4,
    this.border = false,
    required this.height,
    this.press,
    this.color = primaryColor,
    this.textColor = Colors.white,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: height,
      decoration: border
          ? BoxDecoration(
              border: Border.all(
                  color: textColor, // Set border color
                  width: 1.0), // Set border width
              borderRadius: BorderRadius.all(Radius.circular(8.0)),
            )
          : null,
      child: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(8.0),
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
            ),
            onPressed: press,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Visibility(
                  visible: iconDisplay,
                  child: Icon(
                    icon,
                    color: iconColor,
                    size: iconSize,
                  ),
                ),
                SizedBox(
                  width: spaceIconText,
                ),
                Text(
                  text,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: textColor, fontSize: fontSize),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
