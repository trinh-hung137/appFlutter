import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_badger/flutter_app_badger.dart';
import 'package:vncare_qlhk/screens/home/presentation/components/body.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late int _totalNotifications;

  void registerNotification() {
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      setState(() {
        _totalNotifications++;
      });
    });
  }

  @override
  void initState() {
    _totalNotifications = 0;
    registerNotification();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(openThongBao),
    );
  }

  void openThongBao() {}
}
