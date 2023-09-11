import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../config/styles/Dimens.dart';
import '../../qlhk_icons.dart';

class CustomContain extends StatelessWidget {
  final String containerText;
  final VoidCallback onPress;
  final FocusNode focusNode;
  final TextEditingController textEditingController;

  CustomContain({
    Key? key,
    required this.containerText,
    required this.onPress,
    required this.textEditingController,
    required this.focusNode,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 18,
            child: Text(
              containerText,
              style: TextStyle(fontSize: 12),
            ),
          ),
          SizedBox(height: 4),
          Container(
              // margin: EdgeInsets.only(right: 5),
              height: 32,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(4.0),
                ),
                child: TextField(
                  inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[a-zA-ZÀ-ỹ ]')),],
                  maxLines: 1,
                  controller: textEditingController,
                  focusNode: focusNode,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: defaultTextInsideBoxPadding, right: 0),
                    fillColor: Colors.white,
                    suffixIcon: Visibility(
                      visible: textEditingController.text != '' ? true : false,
                      child: GestureDetector(
                        onTap: onPress,
                        child: Icon(
                          Qlhk.cancel,
                          size: 14,
                        ),
                      ),
                    ),

                    border: new OutlineInputBorder(
                      borderRadius: new BorderRadius.circular(4.0),
                    ),
                    // focusedBorder: OutlineInputBorder(
                    //     borderSide: BorderSide(width: 1, color: Colors.grey)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(4)),
                        borderSide:
                            BorderSide(color: Color(0xFFE0E0E0), width: 1.0)),
                    suffixIconConstraints: BoxConstraints(
                      minWidth: 30,
                      minHeight: 25,
                    ),
                  ),
                ),
              )),
        ]);
  }
}
