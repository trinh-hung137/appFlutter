import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/screens/splash/data/model/OnboardModel.dart';

class ThirdPage extends StatelessWidget {
  final OnboardModel model;

  const ThirdPage({Key? key, required this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MediaQueryData deviceData = MediaQuery.of(context);
    double deviceWidth = deviceData.size.width;
    double deviceHeight = deviceData.size.height;
    var smallestDimension = MediaQuery.of(context).size.height;
    final isSmallMobile = smallestDimension < 600;
    final isMediumMobile = 600 <= smallestDimension && smallestDimension < 1200;
    return Container(
      height: deviceHeight,
      color: Colors.white,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned(
            top: (isSmallMobile
                ? -deviceHeight * 0.2
                : isMediumMobile
                    ? deviceHeight * 0
                    : -deviceHeight * 0.1),
            right: 0,
            child: SvgPicture.asset(
              "assets/icons/splash/Vector 2.2.svg",
              width: deviceWidth,
            ),
          ),
          Positioned(
            top: (isSmallMobile
                ? deviceHeight * 0.1
                : isMediumMobile
                    ? deviceHeight * 0.2
                    : deviceHeight * 0.1),
            left: 0,
            child: SvgPicture.asset(
              "assets/icons/splash/Group 3.svg",
              width: deviceWidth * 0.5,
              // height: deviceHeight * 0.2,
            ),
          ),
          Positioned(
            top: (isSmallMobile
                ? deviceHeight * 0.1
                : isMediumMobile
                    ? deviceHeight * 0.3
                    : deviceHeight * 0.2),
            right: 0,
            child: SvgPicture.asset(
              "assets/icons/splash/Frame3.svg",
              width: deviceWidth * 0.8,
              // height: deviceHeight * 0.2,
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: (isSmallMobile
                  ? deviceHeight * 0.1
                  : isMediumMobile
                      ? deviceHeight * 0.05
                      : deviceHeight * 0),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  height: deviceHeight * (329 / 812),
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: isSmallMobile
                          ? deviceHeight * 0.04
                          : deviceHeight * 0.24),
                  child: Text(
                    model.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (isSmallMobile
                          ? 20
                          : isMediumMobile
                              ? 20
                              : 50),
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Nunito Sans',
                      color: Color(0xFF06164B),
                      height: 1.5,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    top: deviceHeight * (24 / 812),
                    left: deviceWidth * (24 / 375),
                    right: deviceWidth * (24 / 375),
                  ),
                  child: Text(
                    model.desc,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: (isSmallMobile
                          ? 14
                          : isMediumMobile
                              ? 14
                              : 40),
                      fontFamily: 'Nunito Sans',
                      height: 1.5,
                      color: Color(0xFF06164B),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
