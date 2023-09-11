import 'dart:io';

import 'package:flutter/material.dart';
import 'package:jwt_decode/jwt_decode.dart';
import 'package:vncare_qlhk/screens/home/presentation/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/presentation/ManageCaculator.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

class Body extends StatelessWidget {
  final String token = StorePreferences.getAccessToken();
  final Function() onThongBao;
  Body(this.onThongBao);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double deviceHeight = MediaQuery.of(context).size.height;
    final isSmallMobile =
        Platform.isAndroid ? deviceHeight < 600 : deviceHeight < 700;
    final isMediumMobile =
        Platform.isAndroid ? deviceHeight < 1200 : deviceHeight < 1000;
    // This size provide us total height and width of our screen
    var totalNotify = StorePreferences.getNotificattion();
    return Background(
      userName: getUserName(),
      userId: getUserId(),
      hospitalName: getHospitalName(),
      child: Stack(
        children: <Widget>[
          Positioned(
            top: isSmallMobile ? deviceHeight * 0.02 : size.height * 0.035,
            right: isSmallMobile
                ? -size.width * 0.05
                : isMediumMobile
                    ? -size.width * 0.01
                    : size.width * 0.03,
            child: new TextButton(
              onPressed: onThongBao,
              child: Stack(
                children: <Widget>[
                  new Icon(
                    Icons.notifications,
                    size: isMediumMobile ? 25 : 40,
                    color: Colors.white,
                  ),
                  Visibility(
                    visible: totalNotify > 0,
                    child: new Positioned(
                      left: size.width * 0.001,
                      child: new Container(
                        decoration: new BoxDecoration(
                          color: Color(0xFFF67B7B),
                          borderRadius: BorderRadius.circular(7),
                        ),
                        constraints: BoxConstraints(
                          minWidth: 12,
                          minHeight: 12,
                        ),
                        child: new Align(
                          alignment: Alignment.center,
                          child: new Text(
                            totalNotify <= 9 ? totalNotify.toString() : "9+",
                            style: new TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: new Container(
              height: isSmallMobile ? size.height * 0.44 : size.height * 0.44,
              width: size.width,
              color: Colors.transparent,
              child: new Container(
                  decoration: new BoxDecoration(
                      color: Color(0xFFFDFDFD),
                      borderRadius: new BorderRadius.only(
                        topLeft: const Radius.circular(40.0),
                        topRight: const Radius.circular(40.0),
                      )),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      SizedBox(
                        height: isSmallMobile
                            ? size.height * 0.02
                            : size.height * 0.025,
                      ),
                      Text(
                        AppLocalizations.of(context)!
                            .translate('home_card_title'),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: isMediumMobile ? 20 : 36,
                          shadows: <Shadow>[
                            Shadow(
                              offset: Offset(0.0, 4.0),
                              blurRadius: 4.0,
                              color: Color.fromARGB(0, 0, 0, 1),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> ManageCaculator()));
                        },
                        child: SvgPicture.asset(
                          "assets/icons/home/Group 1616.svg",
                          height: isSmallMobile
                              ? size.height * 0.17
                              : size.height * 0.17 * 2 < size.width * 0.8
                                  ? size.height * 0.17
                                  : size.height * 0.16 * 2 < size.width * 0.8
                                      ? size.height * 0.16
                                      : size.height * 0.15,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Material(
                        // needed
                        color: Colors.transparent,
                        child: InkWell(
                          onTap: () {}, // needed
                          child: SvgPicture.asset(
                            "assets/icons/home/Group 1623.svg",
                            height: isSmallMobile
                                ? size.height * 0.17
                                : size.height * 0.17 * 2 < size.width * 0.8
                                    ? size.height * 0.17
                                    : size.height * 0.16 * 2 < size.width * 0.8
                                        ? size.height * 0.16
                                        : size.height * 0.15,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }

  String getUserName() {
    final Map<String, dynamic> payload = Jwt.parseJwt(this.token);
    return payload['sName'];
  }

  String getUserId() {
    final Map<String, dynamic> payload = Jwt.parseJwt(this.token);
    return payload['username'];
  }

  String getHospitalName() {
    final Map<String, dynamic> payload = Jwt.parseJwt(this.token);
    return payload['hName'];
  }
}
