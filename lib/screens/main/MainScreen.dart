import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vncare_qlhk/config/styles/CustomColor.dart';
import 'package:vncare_qlhk/screens/account/AccountScreen.dart';
import 'package:vncare_qlhk/screens/main/ViewModelMain.dart';
import 'package:vncare_qlhk/screens/main/data/model/RegisterDeviceParam.dart';
import 'package:vncare_qlhk/screens/home/presentation/HomeScreen.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/SettingScreen.dart';

// Import the firebase_core plugin
import 'package:firebase_messaging/firebase_messaging.dart';
// import 'package:flutter/material.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with WidgetsBindingObserver {
  int pageIndex = 0;
  List<Widget> pageList = <Widget>[
    HomeScreen(),
    SettingScreen(),
    AccountScreen(),
  ];

  late final FirebaseMessaging _messaging;
  final ViewModelMain viewModelMain = ViewModelMain();
  final RegisterDeviceParam registerDeviceParam = RegisterDeviceParam();
  String tokenFirebase = StorePreferences.getTokenFirebase();

  static Future<String> getDeviceId() async {
    String deviceId = "";
    var deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        deviceId = androidDeviceInfo.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        deviceId = iosDeviceInfo.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      print('Failed to get platform version');
    }
    return deviceId;
  }

  void registerDevice() {
    print("getTokenFirebase:" + tokenFirebase);
    if (tokenFirebase.isEmpty) {
      _messaging.getToken().then((token) {
        getDeviceId().then((id) {
          registerDeviceParam.deviceToken = token;
          registerDeviceParam.udid = id;
          if (Platform.isAndroid) {
            registerDeviceParam.os = "Android";
            registerDeviceParam.type = "firebase";
          } else {
            registerDeviceParam.os = "IOS";
            registerDeviceParam.type = "voip";
          }
          viewModelMain.postRegisterDevice(registerDeviceParam);
          viewModelMain.registerDevice.listen((data) {
            if (data.errorCode == ERROR_CODE_SUCCESS) {
              StorePreferences.setTokenFirebase(token!);
              print("setTokenFirebase:" + token);
            }
          });
        });
      });
    }
  }

  @override
  void initState() {
    print('initState###############');
    StorePreferences.removeCatalogs();
    super.initState();
    WidgetsBinding.instance!.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(final AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      setState(() async {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.reload();
        final int counter = (prefs.getInt('notification') ?? 0);
        StorePreferences.setNotification(counter);
        FlutterAppBadger.updateBadgeCount(counter);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pageList[pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.white,
        selectedIconTheme: IconThemeData(color: primaryColor),
        selectedItemColor: const Color(0xFF292D34),
        selectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        unselectedItemColor: Color(0xFF82858A),
        unselectedLabelStyle:
            TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
        currentIndex: pageIndex,
        onTap: (value) {
          setState(() {
            pageIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(
                  Icons.home,
                  size: 20,
                ),
              ],
            ),
            label: AppLocalizations.of(context)!
                .translate('bottom_navigation_bar_home_title'),
          ),
          BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(
                  Icons.settings,
                  size: 20,
                ),
              ],
            ),
            label: AppLocalizations.of(context)!
                .translate('bottom_navigation_bar_setting_title'),
          ),
          BottomNavigationBarItem(
            icon: new Stack(
              children: <Widget>[
                new Icon(
                  Icons.person,
                  size: 20,
                ),
              ],
            ),
            label: AppLocalizations.of(context)!
                .translate('bottom_navigation_bar_profile_title'),
          ),
        ],
      ),
    );
  }
}
