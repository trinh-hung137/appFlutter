import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';

class EmptyDataView extends StatelessWidget {
  final String? msg;

  const EmptyDataView({
    Key? key,
    this.msg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var smallestDimension = MediaQuery.of(context).size.shortestSide;
    final isMobile = smallestDimension < 600;
    return Expanded(
      child: Center(
        child: Column(
          children: [
            SizedBox(height: size.height * 0.04),
            SvgPicture.asset(
              "assets/icons/emptydata/Group 8549.svg",
              width: isMobile ? size.width * 0.7 : size.width * 0.6,
              fit: BoxFit.cover,
            ),
            SizedBox(height: size.height * 0.03),
            Text(
              msg ??
                  AppLocalizations.of(context)?.translate('empty_data_msg') ??
                  "",
              style: new TextStyle(
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
