import 'package:flutter/material.dart';

class CustomButtonCheckbox extends StatelessWidget {
  final double height;
  final String textButton;
  final VoidCallback onPressed;
  final bool checkIcon;
  CustomButtonCheckbox(
      {Key? key,
        required this.height,
        required this.textButton,
        required this.onPressed,
        required this.checkIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height,
        child: ElevatedButton(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ColorFiltered(
                colorFilter:
                ColorFilter.mode(Color(0xFF6F9BD4), BlendMode.srcIn),
                child: Container(
                    width: 18,
                    height: 18,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 1.5),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkIcon == true
                        ? Icon(
                      Icons.check,
                      size: 14,
                      color: Colors.white,
                    )
                        : null),
              ),
              SizedBox(
                width: 4,
              ),
              Text(textButton)
            ],
          ),
          onPressed: onPressed,
          style: ButtonStyle(
              backgroundColor: MaterialStatePropertyAll(Colors.white),
              foregroundColor: MaterialStatePropertyAll(
                Color(0xFF6F9BD4),
              ),
              side: MaterialStatePropertyAll(
                  BorderSide(color: Color(0xFF6F9BD4))),
              shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8)))),
        ));
  }
}
