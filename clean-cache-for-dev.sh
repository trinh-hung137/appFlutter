#!/usr/bin/env bash

cd ./ios
rm -rf Pods  
rm -rf Podfile.lock  
rm -rf ~/.pub-cache/hosted/pub.dartlang.org/  

cd ..
flutter clean  
flutter pub get  

cd ./ios
pod install
pod repo update  

cd ..
flutter build ios
