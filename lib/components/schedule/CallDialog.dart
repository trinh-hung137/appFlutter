import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

import '../button/FixedBottomButton.dart';

class CallDialog extends StatelessWidget {
  final String phonenumber;

  const CallDialog({
    Key? key,
    required this.phonenumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double heightCallDialog = 360;
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: Container(
        height: heightCallDialog * 0.85,
        width: heightCallDialog,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: <Widget>[
            Container(
              height: heightCallDialog * 0.4,
              child: Column(
                children: [
                  SizedBox(height: heightCallDialog * 0.05),
                  SvgPicture.asset(
                    "assets/icons/setting/Group 1668.svg",
                    height: heightCallDialog * 0.35,
                    fit: BoxFit.cover,
                  ),
                ],
              ),
            ),
            Container(
              height: heightCallDialog * 0.3,
              child: Column(
                children: [
                  SizedBox(height: 10.0),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        AppLocalizations.of(context)!.translate('call'),
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold,
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        AppLocalizations.of(context)!
                            .translate('choose_call_method'),
                        style: TextStyle(
                          fontSize: 14.0,
                          fontWeight: FontWeight.w300,
                        ),
                      )),
                  SizedBox(height: 15.0),
                ],
              ),
            ),
            Container(
              // height: heightCallDialog * 0.3,
              child: Column(
                children: [
                  // Padding(
                  //   padding: EdgeInsets.only(left: 20, right: 20),
                  //   child: FixedBottomButton(
                  //     border: true,
                  //     height: 32,
                  //     icon: Icons.ac_unit,
                  //     iconColor: primaryColor,
                  //     iconDisplay: false,
                  //     color: Color(0xFFFFFFFF),
                  //     press: () => {},
                  //     text: AppLocalizations.of(context)!
                  //         .translate('call_vn_care'),
                  //     textColor: primaryColor,
                  //   ),
                  // ),
                  // SizedBox(height: 15.0),
                  Container(
                    padding: EdgeInsets.only(left: 20, right: 20),
                    child: FixedBottomButton(
                      border: true,
                      height: 32,
                      icon: Icons.ac_unit,
                      iconColor: primaryColor,
                      iconDisplay: false,
                      color: primaryColor,
                      press: () => {launch('tel:$phonenumber')},
                      text: AppLocalizations.of(context)!
                          .translate('call_phone_number'),
                      textColor: Color(0xFFFFFFFF),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
