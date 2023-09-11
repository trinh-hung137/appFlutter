import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vncare_qlhk/screens/login/presentation/LoginScreen.dart';
import 'package:vncare_qlhk/screens/splash/presentation/SplashScreen.dart';
import 'package:vncare_qlhk/screens/main/MainScreen.dart';
import 'package:vncare_qlhk/utils/AppLocalizations.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';
import 'config/styles/CustomColor.dart';
import 'package:vncare_qlhk/config/enviroment/Environment.dart';
import 'package:overlay_support/overlay_support.dart';

int? isViewed;
Future<Null> main() async {
  const String environment = String.fromEnvironment(
    'ENVIRONMENT',
    defaultValue: Environment.STAGING,
  );

  Environment().initConfig(environment);
  WidgetsFlutterBinding.ensureInitialized();
  await StorePreferences.init();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  isViewed = prefs.getInt('onBoard');
  print("isViewed: " + isViewed.toString());
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return OverlaySupport(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', "US"), // English
          const Locale('vi', "VN"), // Vn
          // ... other locales the app supports
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale?.languageCode &&
                supportedLocale.countryCode == locale?.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        title: 'Quản lý hẹn khám',
        theme: ThemeData(
          primarySwatch: primaryThemeColor,
        ),
        home: MyAppPage(),
      ),
    );
  }
}

class MyAppPage extends StatelessWidget {
  final String accessToken = StorePreferences.getAccessToken();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isViewed != 0
          ? SplashScreen()
          : accessToken.isEmpty
              ? LoginScreen()
              : MainScreen(),
    );
  }

  // void _showAlert(BuildContext context) {
  //   showDialog(
  //       context: context,
  //       builder: (context) => AlertDialog(
  //             title: Text("Wifi"),
  //             content: Text("Wifi not detected. Please activate it."),
  //           ));
  // }
}
