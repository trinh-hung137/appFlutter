import 'dart:io';

import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String title;
  final String value;
  final int maxLines;
  final Function()? onPress;
  final IconData icon;
  final bool? checkRangBuoc;
  final bool? isError;

  const CustomDropDown(
      {Key? key,
      required this.title,
      required this.value,
      this.maxLines = 1,
      this.onPress,
      this.isError = false,
      required this.icon,
      this.checkRangBuoc = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double deviceHeight = MediaQuery.of(context).size.height;
    final isSmallMobile =
        Platform.isAndroid ? deviceHeight < 600 : deviceHeight < 700;
    return Padding(
      padding: EdgeInsets.only(top: 2),
      child: Column(
        children: [
          Row(
            children: <Widget>[
              Expanded(
                flex: 4,
                child: Align(
                    alignment: Alignment.topLeft,
                    child: checkRangBuoc == true
                        ? RichText(
                            text: TextSpan(children: [
                            TextSpan(
                              text: title,
                              style: new TextStyle(
                                color: Color(0xFF535858),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            TextSpan(
                              text: ' (*)',
                              style: TextStyle(color: Colors.red),
                            )
                          ]))
                        : Text(
                            title,
                            style: new TextStyle(
                              color: Color(0xFF535858),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            // textAlign: TextAlign.left,
                          )),
              ),
              Expanded(
                flex: 6,
                child: TextButton(
                  style: ButtonStyle(
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.black),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4.0),
                        side: BorderSide(
                            color: isError! ? Colors.red : Color(0xFFE0E0E0)),
                      ),
                    ),
                  ),
                  onPressed: onPress,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 9,
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                              maxWidth: isSmallMobile
                                  ? size.width * 0.42
                                  : size.width * 0.45),
                          child: Container(
                            child: Text(
                              value,
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
                      ),
                      Expanded(
                        child: Icon(
                          icon,
                          color: Color(0xFFBBC2C6),
                          size: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Visibility(
            visible: isError!,
            child: Row(
              children: [
                Expanded(flex: 4, child: SizedBox()),
                Expanded(
                    flex: 6,
                    child: Container(
                        margin: EdgeInsets.fromLTRB(8, 0, 0, 0),
                        child: Text(
                          'Không để trống trường này',
                          style: TextStyle(fontSize: 12, color: Colors.red),
                        ))),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
