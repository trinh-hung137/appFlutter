import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ComingSoonView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var smallestDimension = MediaQuery.of(context).size.shortestSide;
    final isMobile = smallestDimension < 600;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/icons/common/CommingSoon.svg",
          width: isMobile ? size.width * 0.5 : size.width * 0.4,
          fit: BoxFit.cover,
        ),
        SizedBox(height: size.height * 0.05),
        Text(
          "Chức năng này sẽ sớm được \ncập nhật trong thời gian sớm nhất !",
          style: new TextStyle(
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
