import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:vncare_qlhk/components/inputfieldform/InputText.dart';
import 'package:vncare_qlhk/components/button/PrimaryButton.dart';
import 'package:vncare_qlhk/components/inputfieldform/SecurityInputText.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/screens/login/presentation/ViewModelLogin.dart';
import 'package:vncare_qlhk/screens/main/MainScreen.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

import '../../../ProgressHUD.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginScreen> {
  String user = '';
  String pass = '';
  String errorMsg = '';
  final ViewModelLogin viewModelLogin = new ViewModelLogin();
  bool isApiCallProcess = false;
  bool hidePassword = true;
  bool isInvalid = false;
  double inputTextPadding = 20;
  double loginTitlePadding = 0;

  @override
  void initState() {
    super.initState();
    user = StorePreferences.getUsername();
    pass = StorePreferences.getPassword();
    revokeDeviceToken();
    StorePreferences.setAccessToken("");
  }

  @override
  void dispose() {
    viewModelLogin.closeObservable();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
      child: buildLoginViewWidget(),
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      loadingColor: secondColor,
    );
  }

  Widget buildLoginViewWidget() {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double deviceHeight = MediaQuery.of(context).size.height;
          double sizedBoxHeight = 0;
          if (deviceHeight - 350 < 340)
            sizedBoxHeight = deviceHeight -
                350; // 350 là chiều cao tối thiểu của khung đăng nhập
          else
            sizedBoxHeight = deviceHeight *
                0.45; // 340 là chiều cao tối thiểu cho tiêu đề và ảnh
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  minWidth: constraints.maxWidth,
                  minHeight: constraints.maxHeight),
              child: IntrinsicHeight(
                child: Stack(
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.fromLTRB(
                              16, 53, 16, 27), //16 100 16 50
                          child: Row(
                            children: [
                              SvgPicture.asset(
                                'assets/images/logo_app.svg',
                                width: 57,
                                height: 57,
                              ),
                              Container(
                                padding: EdgeInsets.fromLTRB(12, 0, 0, 0),
                                child: Column(
                                  children: [
                                    Container(
                                      padding: EdgeInsets.fromLTRB(0, 0, 0, 8),
                                      child: Text(
                                        "QUẢN LÝ\nLỊCH HẸN KHÁM",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          fontSize: 20,
                                          color: Color(0xFF1C4983),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                            mainAxisAlignment: MainAxisAlignment.center,
                          ),
                        ),
                        Padding(
                          child: SvgPicture.asset(
                            'assets/images/hospital_login.svg',
                            width: 270.03, // 270.03
                            height: 183, // 183
                          ),
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 17),
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: sizedBoxHeight,
                        ),
                        Expanded(
                          child: Container(
                            constraints: BoxConstraints(
                              minHeight: 350,
                            ),
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  topRight: Radius.circular(30)),
                              boxShadow: [
                                BoxShadow(
                                  color: Color(0x26006A67),
                                  offset: Offset(0, -4),
                                  blurRadius: 6,
                                ),
                              ],
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  top: -3,
                                  right: 38,
                                  child: Container(
                                      width: 130,
                                      height: 130,
                                      decoration: BoxDecoration(
                                        color: Color(0x0DFFFFFF),
                                        shape: BoxShape.circle,
                                      )),
                                ),
                                Positioned(
                                  top: 31,
                                  right: -106,
                                  child: Container(
                                      width: 212,
                                      height: 212,
                                      decoration: BoxDecoration(
                                        color: Color(0x0DFFFFFF),
                                        shape: BoxShape.circle,
                                      )),
                                ),
                                Positioned(
                                  left: -105,
                                  bottom: -53,
                                  child: Container(
                                      width: 272,
                                      height: 272,
                                      decoration: BoxDecoration(
                                        color: Color(0x0DFFFFFF),
                                        shape: BoxShape.circle,
                                      )),
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                          padding: EdgeInsets.only(
                                              top: loginTitlePadding),
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .translate('login_title'),
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 20,
                                                color: Color(0xFFFDFDFD)),
                                          )),
                                      Padding(
                                        padding: EdgeInsets.only(top: 12),
                                        child: Visibility(
                                          child: Text(
                                            errorMsg,
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Color(0xFFB43939),
                                              fontSize: 14,
                                            ),
                                          ),
                                          visible: isInvalid,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.fromLTRB(
                                            19.52, inputTextPadding, 31.34, 0),
                                        child: InputText(
                                          focusedBorderColor: Colors.white,
                                          labelText:
                                              AppLocalizations.of(context)!
                                                  .translate('username'),
                                          hintText:
                                              AppLocalizations.of(context)!
                                                  .translate('username_hint'),
                                          value: this.user,
                                          onChanged: (value) =>
                                              setState(() => this.user = value),
                                        ),
                                      ),
                                      SecurityInputText(
                                        focusedBorderColor: Colors.white,
                                        hintText: AppLocalizations.of(context)!
                                            .translate('password_hint'),
                                        labelText: AppLocalizations.of(context)!
                                            .translate('password'),
                                        value: this.pass,
                                        isHidePassword: hidePassword,
                                        onChanged: (value) =>
                                            setState(() => this.pass = value),
                                        onClickIcon: () => setState(() =>
                                            this.hidePassword = !hidePassword),
                                      ),
                                      SizedBox(height: 50),
                                      PrimaryButton(
                                        press: () {
                                          _login(context);
                                        },
                                        text: AppLocalizations.of(context)!
                                            .translate('login'),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _login(BuildContext context) {
    if (user.trim().isEmpty || pass.trim().isEmpty) {
      _showLoginError(
          AppLocalizations.of(context)!.translate('error_login_empty'));
      return;
    }
    setState(() {
      isApiCallProcess = true;
    });
    viewModelLogin.login(user.trim(), pass.trim());
    viewModelLogin.token.listen((data) {
      setState(() {
        isApiCallProcess = false;
      });
      if (data.accessToken!.isNotEmpty) {
        StorePreferences.setUsername(user);
        StorePreferences.setPassword(pass);
        StorePreferences.setAccessToken(data.accessToken!);
        setState(() {
          isInvalid = false;
          inputTextPadding = 20;
        });
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MainScreen()),
            (route) => false);
      } else {
        _showLoginError(
            AppLocalizations.of(context)!.translate('error_login_incorrect'));
      }
    }, onError: (error) {
      setState(() {
        isApiCallProcess = false;
      });
      _showLoginError(
          AppLocalizations.of(context)!.translate('error_server_msg'));
    });
  }

  void _showLoginError(String msg) {
    setState(() {
      isInvalid = true;
      inputTextPadding = 0;
      errorMsg = msg;
    });
  }

  void revokeDeviceToken() {
    String token = StorePreferences.getTokenFirebase();
    if (token.isNotEmpty) {
      setState(() {
        isApiCallProcess = true;
      });
      viewModelLogin.revokeDeviceToken(token);
      StorePreferences.setTokenFirebase("");
      viewModelLogin.revokeToken.listen((data) async {
        setState(() {
          isApiCallProcess = false;
        });
        print("revokeDeviceToken -> errorCode:" + data.errorCode.toString());
      }, onError: (error) {
        setState(() {
          isApiCallProcess = false;
        });
        _showLoginError(
            AppLocalizations.of(context)!.translate('error_server_msg'));
      });
    }
  }
}
