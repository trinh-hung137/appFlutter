import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class InputDialog extends StatelessWidget {
  final String? icon;
  final String? title;
  final String? hintText;
  final bool validate;
  final String? errorText;
  final TextEditingController? textFieldController;
  final String? buttonText;
  final Function()? onPress;
  final Function()? onClose;
  final GlobalKey<FormState>? formKey;

  const InputDialog({
    Key? key,
    this.icon,
    this.title,
    this.hintText,
    this.errorText,
    this.validate = false,
    this.textFieldController,
    this.buttonText,
    this.onPress,
    this.onClose,
    this.formKey,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Stack(key: formKey, children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width / 1.2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: Text(
                    title ?? "Ghi chú",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: defaultPadding),
                  child: TextField(
                    controller: textFieldController,
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      hintText: hintText ?? "Nhập ghi chú",
                      errorText: validate ? errorText : null,
                      contentPadding: const EdgeInsets.only(left: 15),
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(8.0),
                        borderSide: new BorderSide(),
                      ),
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(defaultPadding),
                    child: SizedBox(
                      width: double.infinity,
                      child: TextButton(
                          style: ButtonStyle(
                              foregroundColor: MaterialStateProperty.all<Color>(
                                  Colors.white),
                              backgroundColor: MaterialStateProperty.all<Color>(
                                  primaryColor),
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                      side: BorderSide(color: primaryColor)))),
                          onPressed: onPress,
                          child: Text(buttonText ?? "Đóng")),
                    ))
              ],
            ),
          ),
          Positioned(
              top: 4,
              right: 4,
              child: IconButton(
                  onPressed: onClose,
                  icon: Icon(
                    Icons.close,
                    color: Colors.grey,
                    size: defaultIcon,
                  )))
        ]));
  }
}
