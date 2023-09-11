import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class TextArea extends StatelessWidget {
  final String title;
  final TextEditingController? textController;
  final Function(String)? onChanged;
  const TextArea({
    Key? key,
    required this.title,
    this.textController,
    this.onChanged
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              title,
              style: new TextStyle(
                color: Color(0xFF535858),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ),
        Expanded(
          flex: 6,
          child: Container(
            padding: EdgeInsets.only(top: 4.0),
            child: TextField(
              minLines: 2,
              maxLines: 2,
              style: TextStyle(
                color: Color(0xFF444444),
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              controller: textController,
              onChanged: onChanged,
              decoration: new InputDecoration(
                contentPadding: const EdgeInsets.only(
                    left: defaultTextInsideBoxPadding,
                    right: defaultTextInsideBoxPadding),
                fillColor: Colors.white,
                enabledBorder: const OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Color(0xFFE0E0E0), width: 1.0),
                ),
                border: new OutlineInputBorder(
                  borderRadius: new BorderRadius.circular(4.0),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
