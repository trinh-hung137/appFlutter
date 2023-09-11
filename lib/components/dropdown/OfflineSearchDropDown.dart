import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class OfflineSearchDropDown extends StatelessWidget {
  final String title;
  final String value;
  final Function()? onPress;
  final IconData icon;

  const OfflineSearchDropDown(
      {Key? key,
      required this.title,
      required this.value,
      this.onPress,
      required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double deviceHeight = MediaQuery.of(context).size.height;
    final isSmallMobile =
        Platform.isAndroid ? deviceHeight < 600 : deviceHeight < 700;
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(
            left: 8,
          ),
          child: Align(
            alignment: Alignment.topLeft,
            child: new Text(
              title,
              style: new TextStyle(fontSize: 12, color: Color(0xFF535858)),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(left: 8.0, right: defaultRowPadding, bottom: 8.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
              foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  side: BorderSide(color: Color(0xFFE0E0E0)),
                ),
              ),
            ),
            onPressed: onPress,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConstrainedBox(
                  constraints: BoxConstraints(
                      maxWidth: isSmallMobile
                          ? size.width * 0.28
                          : size.width * 0.315),
                  child: Container(
                    child: Text(
                      value,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: Color(0xFF444444)),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                Icon(
                  icon,
                  color: Color(0xFFBBC2C6),
                  size: 16,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
