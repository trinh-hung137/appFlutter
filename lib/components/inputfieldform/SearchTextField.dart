import 'package:flutter/material.dart';
import '../../config/styles/CustomColor.dart';

class TextFieldWidget extends StatefulWidget {
  final String title;
  final TextEditingController textController;
  final FocusNode focusNode;
  final Color? color;
  final bool? isNumberKeyboard;
  const TextFieldWidget({
    key,
    required this.title,
    required this.textController,
    this.isNumberKeyboard = false,
    required this.focusNode,
    this.color,
  });
  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    String entertext;
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            flex: 3,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                widget.title,
                style: TextStyle(
                    color: widget.color ?? Color(0xFF535858),
                    fontSize: 12,
                    decoration: TextDecoration.none,
                    decorationThickness: 0
                ),
                textAlign: TextAlign.left,
              ),
            )
        ),
        SizedBox(height: 4,),
        Expanded(
          flex: 7,
          child: Container(
            width: double.infinity,
            child: TextFormField(
              maxLines: 1,
              keyboardType: widget.isNumberKeyboard!
                  ? TextInputType.number
                  : TextInputType.text,
              cursorColor: primaryColor,
              decoration: new InputDecoration(
                filled: true,
                contentPadding: EdgeInsets.only(
                    left: 16, right: 0, top: 4, bottom: 4
                ),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderSide:
                  const BorderSide(color: Colors.transparent, width: 1.0),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: primaryColor
                  ),
                  borderRadius: BorderRadius.circular(8.0),
                ),
                suffixIcon: widget.textController.text.length > 0 ? IconButton(
                    onPressed: (){
                      setState(() {
                        widget.textController.clear();
                      });
                    },
                    icon: Icon(Icons.cancel_outlined, size: 16,color: primaryColor,)
                ) : Container(height: 0, width: 0,),

              ),
              onChanged: (text) {
                setState(() {
                  entertext = text.toLowerCase();
                  print(entertext);
                });
              },
              controller: widget.textController,
              focusNode: widget.focusNode,

            ),
          ),
        ),

      ],
    );
  }
}