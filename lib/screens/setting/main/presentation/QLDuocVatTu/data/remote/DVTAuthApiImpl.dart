import 'dart:convert';

import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/model/DVT.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/remote/DVTAuthApi.dart';
import 'package:http/http.dart' as http;

import '../../../../../../../utils/Constants.dart';
import '../../../../../../../utils/StorePreferences.dart';
class DVTAuthApiImpl implements DVTAuthApi{
  final String token = StorePreferences.getAccessToken();
  @override
  Future<DuocVatTu> addDuocVatTu(DuocVatTu dvt) async{
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/vattu';
    try {
      final uri = Uri.parse(url);
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(dvt))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );

      if (response.statusCode == 201 ||
          response.statusCode == Bad_Request_Code) {
        return dvt;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }

  @override
  Future<BaseResponse> deleteDuocVatTu(String id) async{
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/vattu/';
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
  Future<List<DuocVatTu>> getAllDuocVatTu() async{
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/vattu';
    try {
      final uri = Uri.parse(url);
      var headers = {'Content-Type': 'application/json'};
      final response = await http.get(uri, headers: headers).timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        final List<dynamic> jsonList = json.decode(utf8.decode(response.bodyBytes));
        final List<DuocVatTu> timeBlocks =
        jsonList.map((json) => DuocVatTu.fromJson(json)).toList();
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
  Future<BaseResponse> updateDuocVatTu(DuocVatTu dvt) async{
    print('======================\nvao goi api update\n');
    String param=dvt.id.toString();
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/vattu/';
    try {
      final uri = Uri.parse(url+param);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(dvt))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        return BaseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }

}