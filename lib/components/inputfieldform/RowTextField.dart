import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';
import 'package:vncare_qlhk/qlhk_icons.dart';

class RowTextField extends StatelessWidget {
  final String title;
  final Color? color;
  final TextEditingController? textController;
  final bool? isShowIcon;
  final Icon? icon;
  final bool? isNumberKeyboard;
  final Function(String)? onChanged;
  final bool show;
  final bool read;
  final Function()? onTap;
  final bool? checkRangBuoc;
  final FocusNode? focusNode;
  final VoidCallback? onPress;
  final Color? backgroudText;
  final bool? isError;

  RowTextField({Key? key,
    required this.title,
    this.color,
    this.textController,
    this.isShowIcon,
    this.onChanged,
    this.isNumberKeyboard = false,
    this.show = true,
    this.read = false,
    this.onTap,
    this.checkRangBuoc,
    this.focusNode,
    this.onPress,
    this.icon,
    this.backgroudText,
    this.isError=false
  });


  @override
  Widget build(BuildContext context) {
    return Column(
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
                              color: color ?? Color(0xFF535858),
                              fontSize: 14,
                              fontWeight: FontWeight.w400,
                            ),
                            // textAlign: TextAlign.left,
                          ),
                          TextSpan(
                            text: ' (*)',
                            style: TextStyle(color: Colors.red),
                          )
                        ]))
                        : Text(
                      title,
                      style: new TextStyle(
                        color: color ?? Color(0xFF535858),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      // textAlign: TextAlign.left,
                    )),
              ),
              Expanded(
                  flex: 6,
                  child: Container(
                    height: 36,
                    child: TextFormField(
                      maxLines: 1,
                      keyboardType: isNumberKeyboard!
                          ? TextInputType.number
                          : TextInputType.text,
                      style: TextStyle(
                        color: color ?? Color(0xFF444444),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                      controller: textController,
                      onChanged: onChanged,
                      focusNode: focusNode,
                      onTap: onTap,
                      decoration: new InputDecoration(
                        errorStyle: TextStyle(fontSize: 12, height: 0.4),
                        focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: primaryColor, width: 2.0)
                        ),
                        contentPadding: const EdgeInsets.only(
                            left: defaultTextInsideBoxPadding, right: 0),
                        fillColor: backgroudText ?? Colors.white,
                        filled: true,
                        enabledBorder:  OutlineInputBorder(
                          borderSide:
                          BorderSide(color: isError!?Colors.red:Color(0xFFE0E0E0), width: 1.0),
                        ),
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(4.0),
                        ),
                        suffixIcon: Visibility(
                          // visible: isShowIcon ?? false,
                          visible:
                              textController?.text != '' || isShowIcon == true ? true : false,
                          child: GestureDetector(
                            onTap: onPress,
                            child: icon ?? Icon(
                              // Qlhk.check_circle,
                              Qlhk.cancel,
                              size: 14,
                            ),
                          ),
                        ),
                        suffixIconConstraints: BoxConstraints(
                          minWidth: 30,
                          minHeight: 25,
                        ),
                      ),
                      cursorColor: primaryColor,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      showCursor: show,
                      readOnly: read,
                    ),
                  )
              )
            ]
        ),
        Visibility(
          visible: isError!,
          child: Column(
            children: [
              SizedBox(height: 8,),
              Row(
                children: [
                  Expanded(flex:4,
                      child: SizedBox()),
                  Expanded(
                      flex: 6,
                      child: Container(
                          margin: EdgeInsets.fromLTRB(8,0,0,0),
                          child: Text('Không để trống trường này', style: TextStyle(fontSize: 12, color: Colors.red),))),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}