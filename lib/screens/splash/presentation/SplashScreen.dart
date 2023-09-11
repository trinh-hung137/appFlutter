import 'dart:async';

import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/screens/login/presentation/LoginScreen.dart';
import 'package:vncare_qlhk/screens/splash/data/model/OnboardModel.dart';

import 'FirstPage.dart';
import 'SecondPage.dart';
import 'ThirdPage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  int _currentPage = 0;
  late Timer pageTimer;
  List<OnboardModel> screens = <OnboardModel>[
    OnboardModel(
      img: "assets/images/splash_1.svg",
      title: "Quản lý lịch hẹn khám tại CSYT",
      desc:
          "Nhân viên tư vấn tìm kiếm, xem danh sách lịch hẹn khám của bệnh nhân. "
          "Xem chi tiết lịch hẹn, gọi video call cho bệnh nhân, "
          "phê duyệt hoặc từ chối lịch hẹn của bệnh nhân",
      backgroundImg: "assets/images/splash_curve_1.svg",
    ),
    OnboardModel(
      img: "assets/images/splash_2.svg",
      title: "Quản lý lịch hẹn tư vấn online",
      desc: "Sử dụng để thực hiện khám sàng lọc cho bệnh nhân, "
          "cập nhật các kết quả khám sàng lọc cho phép bác sĩ gọi video và trả "
          "kết quả khám cho bệnh nhân",
      backgroundImg: "assets/images/splash_curve_2.svg",
    ),
    OnboardModel(
      img: "assets/images/splash_3.svg",
      title: "Tìm kiếm, xem danh sách, \nxem chi tiết lịch hẹn, gọi video call",
      desc:
          "Quản lý bệnh nhân bệnh nhân đăng ký khám BHYT và đăng ký khám “viện phí”",
      backgroundImg: "assets/images/splash_curve_3.svg",
    ),
  ];
  PageController _pageController = PageController(
    initialPage: 0,
  );

  @override
  void initState() {
    super.initState();
    pageTimer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < 2) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      _pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageTimer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var smallestDimension = MediaQuery.of(context).size.height;
    final isSmallMobile = smallestDimension < 600;
    final isMediumMobile = 600 <= smallestDimension && smallestDimension < 1200;
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (value) {
              _currentPage = value;
              setState(() {});
            },
            children: [
              FirstPage(model: screens[0]),
              SecondPage(model: screens[1]),
              ThirdPage(model: screens[2]),
            ],
          ),
          Positioned.fill(
            bottom: 20,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  DotsIndicator(
                    dotsCount: 3,
                    position: _currentPage.toInt(),
                    decorator: DotsDecorator(
                      color: Color(0xFFDDE1E7),
                      activeColor: Color(0xFF6F9BD4),
                      size: Size(size.width * 0.02, size.width * 0.02),
                      activeSize: Size(size.width * 0.02, size.width * 0.02),
                    ),
                  ),
                  SizedBox(height: size.height * 0.005),
                  ElevatedButton(
                    onPressed: () async {
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      prefs.setInt('onBoard', 0);
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                    // onPressed: () => {print(size.shortestSide)},
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: size.width * 0.04,
                        right: size.width * 0.04,
                        top: size.height * 0.01,
                        bottom: size.width * 0.01,
                      ),
                      child: Text(
                        "Đăng nhập",
                        style: TextStyle(
                          fontSize: (isSmallMobile
                              ? 14
                              : isMediumMobile
                                  ? 14
                                  : 40),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(primaryColor),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
