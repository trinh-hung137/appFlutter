import 'package:flutter/material.dart';
import 'package:vncare_qlhk/screens/login/presentation/LoginScreen.dart';
import 'package:vncare_qlhk/screens/account/main/presentation/components/background.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/screens/account/changePassword/presentation/ChangePasswordScreen.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: Positioned(
        top: size.height * 0.04,
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return ChangePasswordScreen();
                    },
                  ),
                );
              },
              child: SvgPicture.asset(
                "assets/icons/setting/Group 1673.svg",
                width: size.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            TextButton(
              onPressed: () => {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                    (route) => false)
              },
              child: SvgPicture.asset(
                "assets/icons/setting/Group 1674.svg",
                width: size.width * 0.9,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
