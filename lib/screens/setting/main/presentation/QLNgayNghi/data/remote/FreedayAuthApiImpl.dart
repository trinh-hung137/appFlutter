import 'dart:convert';

import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/model/FreeDay.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/remote/FreedayAuthApi.dart';

import '../../../../../../../utils/Constants.dart';
import '../../../../../../../utils/StorePreferences.dart';
import 'package:http/http.dart' as http;
class FreedayAuthApiImpl implements FreedayAuthApi{
  final String token = StorePreferences.getAccessToken();

  @override
  Future<BaseResponse> addFreeday(FreeDay freeDay) async{
    String url =
        'https://64d48506b592423e46943417.mockapi.io/flutter/api/freeday';
    try {
      final uri = Uri.parse(url);
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(freeDay))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == 201 ||
          response.statusCode == Bad_Request_Code) {
        return BaseResponse.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }

  }

  @override
  Future<BaseResponse> deleteFreeday(String id) async{
    String url =
        'https://64d48506b592423e46943417.mockapi.io/flutter/api/freeday/';
    try {
      final uri = Uri.parse(url+id);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .delete(uri, headers: headers)
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        return BaseResponse.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }

  @override
  Future<List<FreeDay>> getAllFreeday() async{
    String url =
        'https://64d48506b592423e46943417.mockapi.io/flutter/api/freeday';
    try {
      final uri = Uri.parse(url);
      var headers = {'Content-Type': 'application/json'};
      final response = await http.get(uri, headers: headers).timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      print('=====================\nvao 2');
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        final List<dynamic> jsonList = json.decode(utf8.decode(response.bodyBytes));
        final List<FreeDay> timeBlocks =
        jsonList.map((json) => FreeDay.fromJson(json)).toList();
        return timeBlocks;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      print('==================\nloi:' + e.toString());
      throw Exception("There was a problem with the connection");
    }
  }

  @override
  Future<BaseResponse> updateFreeday(FreeDay freeDay) async{
    String param=freeDay.id.toString();
    String url =
        'https://64d48506b592423e46943417.mockapi.io/flutter/api/freeday/';
    try {
      final uri = Uri.parse(url+param);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(freeDay))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        return BaseResponse.fromJson(json.decode(utf8.decode(response.bodyBytes)));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }
}