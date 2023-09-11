import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class SecurityInputTextBorder extends StatelessWidget {
  final String? hintText;
  final String? labelText;
  final String? errorText;
  final String? value;
  final bool validate;
  final bool isHidePassword;
  final Function(String)? onChanged;
  final Function()? onClickIcon;
  const SecurityInputTextBorder(
      {Key? key,
      this.hintText,
      this.labelText,
      this.errorText,
      this.value,
      this.validate = false,
      this.isHidePassword = true,
      this.onChanged,
      this.onClickIcon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(defaultPadding),
        child: TextFormField(
            initialValue: value,
            obscureText: isHidePassword,
            onChanged: onChanged,
            style: new TextStyle(fontSize: 15),
            decoration: InputDecoration(
              errorText: validate ? errorText : null,
              contentPadding: const EdgeInsets.only(left: 15),
              border: new OutlineInputBorder(
                borderRadius: new BorderRadius.circular(8.0),
                borderSide: new BorderSide(),
              ),
              suffixIcon: IconButton(
                onPressed: onClickIcon,
                icon: Icon(
                  isHidePassword ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                  size: defaultIcon,
                ),
              ),
            )));
  }
}
