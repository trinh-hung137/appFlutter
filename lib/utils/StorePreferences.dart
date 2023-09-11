import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class StorePreferences {
  static Future<SharedPreferences> get _instance async =>
      _preferences ??= await SharedPreferences.getInstance();
  static SharedPreferences? _preferences;
  static const _keyAccessToken = 'access_token';
  static const _keyUsername = 'username';
  static const _keyPassword = 'password';
  static const _keyHttpCode = 'httpcode';
  static const _keyNotification = 'notification';
  static const _keyTokenFirebase = 'token_firebase';
  static const _keyFilterDate = 'filter_date';
  static const _keyCatalogs = 'catalogs';
  static const _keyUpdateDrug = 'update_drug';
  static const _keyListDrug = 'list_drug';

  static Future init() async => _preferences = await _instance;

  static Future setAccessToken(String token) async =>
      await _preferences!.setString(_keyAccessToken, token);

  static String getAccessToken() =>
      _preferences!.getString(_keyAccessToken) ?? "";

  static Future setUsername(String username) async =>
      await _preferences!.setString(_keyUsername, username);

  static String getUsername() => _preferences!.getString(_keyUsername) ?? "";

  static Future setPassword(String password) async =>
      await _preferences!.setString(_keyPassword, password);

  static String getPassword() => _preferences!.getString(_keyPassword) ?? "";

  static Future setHttpCode(int httpCode) async =>
      await _preferences!.setInt(_keyHttpCode, httpCode);

  static int getHttpCode() => _preferences!.getInt(_keyHttpCode) ?? 0;

  static Future setNotification(int notify) async =>
      await _preferences!.setInt(_keyNotification, notify);

  static int getNotificattion() => _preferences!.getInt(_keyNotification) ?? 0;

  static Future setTokenFirebase(String tokenFirebase) async =>
      await _preferences!.setString(_keyTokenFirebase, tokenFirebase);

  static String getTokenFirebase() =>
      _preferences!.getString(_keyTokenFirebase) ?? "";

  static Future setFilterDate(String filterDate) async =>
      await _preferences!.setString(_keyFilterDate, filterDate);

  static String getFilterDate() =>
      _preferences!.getString(_keyFilterDate) ?? "";

  static String getListDrug() => _preferences!.getString(_keyListDrug) ?? "";

  static Future setCatalogs(catalogs) async =>
      await _preferences!.setString(_keyCatalogs, json.encode(catalogs));

  static String getCatalogs() => _preferences!.getString(_keyCatalogs) ?? "";

  static void removeCatalogs() => _preferences!.remove(_keyCatalogs);
}
