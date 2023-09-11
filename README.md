# vncare_qlhk

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Hiện tại đang dùng Material design: 
- Cấu hình "uses-material-design: true" trong file "pubspec.yaml"
- Các icon xem ở: https://fonts.google.com/icons
- icon font thì dùng link này để tạo nhé https://www.fluttericon.com/

## Run project
# run staging:
flutter run --dart-define=ENVIRONMENT=STAGING
or
flutter run

# run product:
flutter run --dart-define=ENVIRONMENT=PROD

## IDE - Visual studio code
- Extension cho Flutter  
View > Command Palette… -> Type “install”, and select Extensions: Install Extensions.

- Debug tools: https://flutter.dev/docs/development/tools/devtools/vscode
View > Command Palette… -> Dart: Open DevTools 

## Deploy to iOS devices
https://flutter.dev/docs/get-started/install/macos#deploy-to-ios-devices

##  migration ứng dụng tới null-safety
	https://dart.dev/null-safety/migration-guide

## Tích hợp notification cho IOS
https://firebase.flutter.dev/docs/messaging/apple-integration

## Fix bug:
- Running "flutter pub get" in vncare_qlhk_mobile...                      
pub get failed (1;     So, because vncare_qlhk depends on both shared_preferences ^0.5.12+4 and intl ^0.17.0, version solving failed.)

- The parameter 'key' can't have a value of 'null' because of its type, but the implicit default value is 'null' at lib/ProgressHUD.dart:12:9 • (missing_default_value_for_parameter)
https://stackoverflow.com/questions/64560461/the-parameter-cant-have-a-value-of-null-because-of-its-type-in-dart#:~:text=The%20reason%20this%20happens%20is,calculate()%20or%20Foo()%20

- "pod install" stuck on "... Installing gRPC-Core (1.28.0)"
https://stackoverflow.com/questions/23755974/cocoapods-pod-install-takes-forever
	rm -rf "${HOME}/Library/Caches/CocoaPods"
	rm -rf "\`pwd\`/Pods/"
	pod install --verbose

- Command PhaseScriptExecution failed with a nonzero exit code
https://github.com/flutter/flutter/issues/76302

- new bug ...



