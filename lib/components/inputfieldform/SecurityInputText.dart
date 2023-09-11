import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class SecurityInputText extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? value;
  final Color focusedBorderColor;
  final bool isHidePassword;
  final Function(String)? onChanged;
  final Function()? onClickIcon;
  const SecurityInputText(
      {Key? key,
      this.hintText,
      this.labelText,
      this.value,
      this.isHidePassword = true,
      this.onChanged,
      this.onClickIcon,
      this.focusedBorderColor = primaryColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(19.52, 21, 31.34, 0),
        child: TextFormField(
            cursorColor: secondColor,
            style: TextStyle(
              color: Color(0xFFFDFDFD),
            ),
            initialValue: value,
            obscureText: isHidePassword,
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
              suffixIcon: IconButton(
                onPressed: onClickIcon,
                icon: Icon(
                  isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.white,
                  size: defaultIcon,
                ),
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
            )));
  }
}
