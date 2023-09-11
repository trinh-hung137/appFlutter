import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';

class ErrorDialog extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? message;
  final String? buttonText;
  final Function()? onPress;
  final Color? bgcolor;
  const ErrorDialog(
      {Key? key,
      this.icon,
      this.title,
      this.message,
      this.buttonText,
      this.onPress,
      this.bgcolor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: Container(
          padding: EdgeInsets.only(top: defaultPadding),
          width: MediaQuery.of(context).size.width / 1.2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Icon(
                icon ?? Icons.cancel_outlined,
                size: 70,
                color: bgcolor ?? warningColor,
              ),
              Padding(
                padding: const EdgeInsets.all(defaultPadding),
                child: Text(
                  title ?? "Thông báo",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                child: Container(
                  child: Text(
                    message ?? "",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(defaultPadding),
                  child: SizedBox(
                    width: double.infinity,
                    child: TextButton(
                        style: ButtonStyle(
                            foregroundColor:
                                MaterialStateProperty.all<Color>(Colors.white),
                            backgroundColor:
                                MaterialStateProperty.all<Color>(primaryColor),
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
        ));
  }
}
