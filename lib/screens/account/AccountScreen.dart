import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/view/ComingSoonView.dart';
import 'package:vncare_qlhk/screens/account/main/presentation/components/body.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
import 'package:vncare_qlhk/utils/SizeScreenDimension.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    final isSmallMobile = deviceHeight < 600;
    final isMediumMobile = deviceHeight < 1200;
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        title: new Text(
          AppLocalizations.of(context)!
              .translate('bottom_navigation_bar_profile_title'),
          style: TextStyle(
            fontFamily: 'Nunito Sans',
            fontWeight: FontWeight.bold,
            fontSize: isSmallMobile
                ? fontSizeTitleSmallScreen
                : isMediumMobile
                    ? fontSizeTitleMediumScreen
                    : fontSizeTitleLargeScreen,
          ),
        ),
        centerTitle: true,
      ),
      body: Body(),
    );
  }
}
