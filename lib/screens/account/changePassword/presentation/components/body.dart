import 'package:flutter/material.dart';
import 'package:vncare_qlhk/components/dialog/ErrorDialog.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/styles/Dimens.dart';
import 'package:vncare_qlhk/components/button/FixedBottomButton.dart';
import 'package:vncare_qlhk/components/inputfieldform/SecurityInputTextBorder.dart';
import 'package:vncare_qlhk/screens/login/presentation/LoginScreen.dart';
import 'package:vncare_qlhk/screens/account/changePassword/presentation/components/background.dart';
import 'package:vncare_qlhk/screens/account/changePassword/presentation/ViewModelChangePassword.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

import '../../../../../ProgressHUD.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  _BodyViewState createState() => _BodyViewState();
}

class _BodyViewState extends State<Body> {
  String token = '';
  String oldpass = '';
  String newpass = '';
  String confirmpass = '';
  bool hideOldPassword = true;
  bool validateOldPassword = false;
  String errorTextOldPassword = '';
  bool hideNewPassword = true;
  bool validateNewPassword = false;
  String errorTextNewPassword = '';
  bool hideConfirmPassword = true;
  bool validateConfirmPassword = false;
  String errorTextConfirmPassword = '';
  final ViewModelChangePassword viewModelChangePassword =
      ViewModelChangePassword();
  bool isApiCallProcess = false;

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    // viewModelChangePassword.closeObservable();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    token = StorePreferences.getAccessToken();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return ProgressHUD(
      inAsyncCall: isApiCallProcess,
      opacity: 0.3,
      child: Scaffold(
        body: Background(
          child: new SingleChildScrollView(
            child: new Container(
              padding: new EdgeInsets.only(bottom: size.height * 0.4),
              child: new Column(
                children: <Widget>[
                  new Container(
                    margin: EdgeInsets.all(defaultPadding),
                    width: double.infinity,
                    child: new Card(
                      child: Column(
                        children: <Widget>[
                          Align(
                            alignment: Alignment.topLeft,
                            child: new Container(
                              padding:
                                  new EdgeInsets.only(left: 15.0, top: 15.0),
                              child: new Text(
                                AppLocalizations.of(context)!
                                    .translate('old_password_title'),
                                style: new TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          SecurityInputTextBorder(
                            validate: validateOldPassword,
                            value: this.oldpass,
                            errorText: errorTextOldPassword,
                            isHidePassword: hideOldPassword,
                            onChanged: (value) => {
                              setState(() => {
                                    this.validateOldPassword = false,
                                    this.oldpass = value,
                                  }),
                            },
                            onClickIcon: () => setState(
                                () => this.hideOldPassword = !hideOldPassword),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: new Container(
                              padding: new EdgeInsets.only(left: 15.0),
                              child: new Text(
                                AppLocalizations.of(context)!
                                    .translate('new_password_title'),
                                style: new TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          SecurityInputTextBorder(
                            validate: validateNewPassword,
                            value: this.newpass,
                            isHidePassword: hideNewPassword,
                            errorText: errorTextNewPassword,
                            onChanged: (value) => {
                              setState(() => {
                                    this.validateNewPassword = false,
                                    this.newpass = value,
                                  }),
                            },
                            onClickIcon: () => setState(
                                () => this.hideNewPassword = !hideNewPassword),
                          ),
                          Align(
                            alignment: Alignment.topLeft,
                            child: new Container(
                              padding: new EdgeInsets.only(left: 15.0),
                              child: new Text(
                                AppLocalizations.of(context)!
                                    .translate('confirm_password_title'),
                                style: new TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                          SecurityInputTextBorder(
                            validate: validateConfirmPassword,
                            errorText: errorTextConfirmPassword,
                            value: this.newpass,
                            isHidePassword: hideConfirmPassword,
                            onChanged: (value) => {
                              setState(() => {
                                    this.validateConfirmPassword = false,
                                    this.confirmpass = value,
                                  }),
                            },
                            onClickIcon: () => setState(() => this
                                .hideConfirmPassword = !hideConfirmPassword),
                          ),
                        ],
                      ),
                    ),
                  ),

                  // SizedBox(height: size.height * 1.0),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: EdgeInsets.all(12),
            child: FixedBottomButton(
              height: defaultButtonHeight,
              icon: Icons.lock,
              color: primaryColor,
              press: () {
                if (checkpassword(oldpass, newpass, confirmpass)) {
                  changepassword(token, oldpass, newpass, confirmpass);
                }
              },
              text: 'Đổi mật khẩu',
            ),
          ),
        ),
      ),
    );
  }

  bool checkpassword(String oldpass, String newpass, String confirmpass) {
    if (confirmpass != newpass ||
        newpass.length < 6 ||
        oldpass.length < 6 ||
        confirmpass.length < 6 ||
        !isNumericUsingRegularExpression(newpass)) {
      if (oldpass.length < 6) {
        setState(
          () => {
            this.validateOldPassword = true,
            this.errorTextOldPassword = AppLocalizations.of(context)!
                .translate('error_text_min_password'),
          },
        );
      }
      if (!isNumericUsingRegularExpression(newpass)) {
        setState(
          () => {
            this.validateNewPassword = true,
            this.errorTextNewPassword = AppLocalizations.of(context)!
                .translate('error_text_condition_password'),
          },
        );
      }
      if (newpass.length < 6) {
        setState(
          () => {
            this.validateNewPassword = true,
            this.errorTextNewPassword = AppLocalizations.of(context)!
                .translate('error_text_min_password'),
          },
        );
      }
      if (confirmpass != newpass) {
        setState(
          () => {
            this.validateConfirmPassword = true,
            this.errorTextConfirmPassword = AppLocalizations.of(context)!
                .translate('error_text_password_incorrect'),
          },
        );
      }
      if (confirmpass.length < 6) {
        setState(
          () => {
            this.validateConfirmPassword = true,
            this.errorTextConfirmPassword = AppLocalizations.of(context)!
                .translate('error_text_min_password'),
          },
        );
      }
      return false;
    }
    return true;
  }

  bool isNumericUsingRegularExpression(String string) {
    final numericRegex = RegExp('(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{6,}');

    return numericRegex.hasMatch(string);
  }

  void changepassword(
      String token, String oldpass, String newpass, String confirmpass) {
    setState(() {
      isApiCallProcess = true;
    });
    viewModelChangePassword.changepassword(token, oldpass, newpass);
    viewModelChangePassword.errormessagechangepassword.listen(
        (data) => {
              setState(() {
                isApiCallProcess = false;
              }),
              if (data.errorCode == ERROR_CODE_FAIL)
                {
                  setState(
                    () => {
                      this.validateOldPassword = true,
                      this.errorTextOldPassword = AppLocalizations.of(context)!
                          .translate('error_text_old_password_not_right'),
                    },
                  ),
                  showInfoDialog(
                      AppLocalizations.of(context)!
                          .translate('change_password_failed'),
                      ERROR_CODE_FAIL),
                },
              if (data.errorCode == ERROR_CODE_SUCCESS)
                {
                  showInfoDialog(
                      AppLocalizations.of(context)!
                          .translate('change_password_success'),
                      ERROR_CODE_SUCCESS),
                },
            }, onError: (error) {
      setState(() {
        isApiCallProcess = false;
      });
      showErrorDialog();
    });
  }

  void showInfoDialog(String msg, int code) {
    showDialog(
      context: context,
      builder: (BuildContext context) => ErrorDialog(
          icon: code == ERROR_CODE_SUCCESS
              ? Icons.check_circle_outline_outlined
              : Icons.cancel_outlined,
          bgcolor: code == ERROR_CODE_SUCCESS ? successColor : warningColor,
          message: msg,
          onPress: () {
            if (code == ERROR_CODE_SUCCESS) {
              Navigator.pop(context, false);
              Navigator.of(context).pop();
            } else {
              Navigator.of(context).pop();
            }
          }),
      barrierDismissible: false,
    );
  }

  void showErrorDialog() {
    if (StorePreferences.getHttpCode() == Unauthorized_Code) {
      showDialog(
        context: context,
        builder: (BuildContext context) => ErrorDialog(
          message:
              AppLocalizations.of(context)!.translate('error_unanthorzed_msg'),
          buttonText: AppLocalizations.of(context)!.translate('login_title'),
          onPress: () {
            Navigator.pop(context, false);
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
                (route) => false);
          },
        ),
        barrierDismissible: false,
      );
    } else {
      showDialog(
          context: context,
          builder: (BuildContext context) => ErrorDialog(
              message:
                  AppLocalizations.of(context)!.translate('error_server_msg'),
              onPress: () {
                Navigator.pop(context, false);
              }));
    }
  }
}
