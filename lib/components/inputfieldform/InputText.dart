import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';

class InputText extends StatelessWidget {
  final String? labelText;
  final String? hintText;
  final String? value;
  final double padding;
  final int maxLines;
  final Color focusedBorderColor;
  final Function(String)? onChanged;

  const InputText(
      {Key? key,
      this.labelText,
      this.hintText,
      this.value,
      this.onChanged,
      this.padding = 0.0,
      this.maxLines = 1,
      this.focusedBorderColor = primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: padding),
      child: TextFormField(
        maxLines: maxLines,
        cursorColor: secondColor,
        style: TextStyle(
          color: Color(0xFFFDFDFD),
        ),
        initialValue: value,
        onChanged: onChanged,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(
            color: Color(0xFFFDFDFD),
            fontSize: 17,
          ),
          helperStyle: TextStyle(
            color: Color(0xFFFDFDFD),
            fontSize: 17,
          ),
          hintText: hintText,
          hintStyle: TextStyle(
            color: Colors.white70,
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.white,
            ),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(
              color: focusedBorderColor,
            ),
          ),
        ),
      ),
    );
  }
}
