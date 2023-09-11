import 'package:flutter/material.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

class ConfirmHealthInsurance extends StatelessWidget {
  final Function()? onPress;

  const ConfirmHealthInsurance({Key? key, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 4,
          child: Align(
            alignment: Alignment.topLeft,
            child: Text(
              "",
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
            child: TextButton(
                onPressed: onPress,
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      AppLocalizations.of(context)!
                          .translate('confirm_health_insurance_card_number'),
                      style: TextStyle(
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                          decoration: TextDecoration.underline),
                    )))),
      ],
    );
  }
}
