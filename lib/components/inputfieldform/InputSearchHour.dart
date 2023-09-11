import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InputSearchHour extends StatelessWidget {
  const InputSearchHour(
      {Key? key,
      this.color,
      required this.textController,
      required this.isShowIcon, required this.iconData})
      : super(key: key);
  final Color? color;
  final bool isShowIcon;
  final IconData iconData;
  final TextEditingController textController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(4),
      ),
      child: TextField(
          maxLines: 1,
          // keyboardType: isNumberKeyboard!
          //     ? TextInputType.number
          //     : TextInputType.text,
          style: TextStyle(
            color: color ?? Color(0xFF444444),
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          controller: textController,
          // onChanged: onChanged,
          decoration: new InputDecoration(
            contentPadding: const EdgeInsets.only(left: 8, right: 0),
            fillColor: Colors.white,
            enabledBorder: const OutlineInputBorder(
              borderSide:
                  const BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
            ),
            border: new OutlineInputBorder(
              borderRadius: new BorderRadius.circular(4.0),
            ),
            suffixIcon: Visibility(
              visible: isShowIcon ?? false,
              child: Icon(
                iconData,
                size: 14,
                color: Colors.black,
              ),
            ),
            suffixIconConstraints: BoxConstraints(
              minWidth: 30,
              minHeight: 25,
            ),
          )),
    );
  }
}
