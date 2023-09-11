import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

class DateButton extends StatelessWidget {
  final String? value;
  final Function()? onPressed;
  final int? maxLines;
  final IconData? icon;
  final isError;
  const DateButton(
      {Key? key, this.value, this.onPressed, this.maxLines = 1, this.icon, this.isError=false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(
          left: defaultPadding, right: defaultPadding, bottom: 8.0),
      child: Column(
        children: [
          TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: isError?Colors.red:Color(0xFFE0E0E0)),
                ),
              ),
            ),
            onPressed: onPressed,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: size.width * 0.75, minWidth: size.width * 0.68),
                  child: Container(
                    child: Text(
                      value ?? "",
                      maxLines: maxLines,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF444444)),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Icon(
                  icon ?? Qlhk.calendar,
                  color: Color(0xFFBBC2C6),
                  size: 16,
                ),
              ],
            ),
          ),
          Visibility(
            visible: isError,
            child: Align(
              alignment: Alignment.centerRight,
              child: Text('Chưa chọn ngày', style: TextStyle(color: Colors.red, fontSize: 13),),
            ),
          ),
        ],
      ),
    );
  }
}
