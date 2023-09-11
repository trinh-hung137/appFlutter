import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

class Background extends StatelessWidget {
  final Widget child;
  final String userName;
  final String userId;
  final String hospitalName;
  const Background({
    Key? key,
    required this.child,
    this.userName = "Nguyễn Vân Anh",
    this.userId = "NVA.123",
    this.hospitalName = "Bệnh viện bưu điện",
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    double deviceWidth = deviceData.size.width;
    double deviceHeight = deviceData.size.height;
    final isSmallMobile =
        Platform.isAndroid ? deviceHeight < 600 : deviceHeight < 700;
    final isMediumMobile =
        Platform.isAndroid ? deviceHeight < 1200 : deviceHeight < 1000;
    return Container(
      height: deviceHeight,
      color: primaryColor,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          new Positioned(
            width: deviceWidth * 0.7,
            top: isSmallMobile ? deviceHeight * 0.04 : deviceHeight * 0.05,
            left: deviceWidth * 0.043,
            child: Text(
              AppLocalizations.of(context)!.translate('home_greeting'),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: isMediumMobile ? 20 : 36,
              ),
            ),
          ),
          Positioned(
            top: isSmallMobile ? deviceHeight * 0.06 : deviceHeight * 0.07,
            width: deviceWidth * 0.9,
            left: deviceWidth * 0.043,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    userName + " - " + userId,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: isMediumMobile ? 20 : 36,
                    ),
                  ),
                  SizedBox(
                    height: isSmallMobile ? 8.0 : 12.0,
                  ),
                  Text(
                    hospitalName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: isMediumMobile ? 18 : 32,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: isSmallMobile
                ? deviceHeight * 0.175
                : isMediumMobile
                    ? deviceHeight * 0.205
                    : deviceHeight * 0.195,
            left: 0,
            child: SvgPicture.asset("assets/icons/home/Ellipse1.svg",
                width: deviceHeight * 0.14),
          ),
          Positioned(
            top: isSmallMobile
                ? deviceHeight * 0.21
                : isMediumMobile
                    ? deviceHeight * 0.225
                    : deviceHeight * 0.215,
            left: 0,
            child: SvgPicture.asset(
              "assets/icons/home/icon_edge.svg",
              width: deviceWidth,
              fit: BoxFit.cover,
              // height: deviceHeight * 0.2,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: SvgPicture.asset(
              "assets/icons/home/Ellipse2.svg",
              width: deviceWidth * 0.2,
            ),
          ),
          child,
        ],
      ),
    );
  }
}
