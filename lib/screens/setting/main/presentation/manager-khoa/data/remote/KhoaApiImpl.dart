import 'dart:convert';

import 'package:http/http.dart' as http;
import '../../../../../../../utils/Constants.dart';
import '../../../../../../../utils/StorePreferences.dart';
import '../../../../../../main/data/model/BaseResponse.dart';
import '../model/Khoa.dart';
import 'KhoaApi.dart';

class KhoaApiImpl implements KhoaApi{
  final String token = StorePreferences.getAccessToken();

  @override
  Future<List<Department>> getAllKhoa() async{
    String url =
        'https://64d2f05867b2662bf3db84c5.mockapi.io/api/flutter/department/';
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
        final List<Department> timeBlocks =
        jsonList.map((json) => Department.fromJson(json)).toList();
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
  Future<BaseResponse> addData(Department khoa) async{
    String url =
        'https://64d2f05867b2662bf3db84c5.mockapi.io/api/flutter/department/';
    try {
      final uri = Uri.parse(url);
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(khoa))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == 201 ||
          response.statusCode == Bad_Request_Code) {
        return BaseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }

  @override
  Future<BaseResponse> updateData(Department khoa) async{
    print('======================\nvao goi api update\n');
    String param=khoa.id.toString();
    String url =
        'https://64d2f05867b2662bf3db84c5.mockapi.io/api/flutter/department/';
    try {
      final uri = Uri.parse(url+param);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(khoa))
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
  @override
  Future<BaseResponse> deleteData(String id, String state) async{
    print('======================\nvao goi api xoa\n');
    String url =
        'https://64d2f05867b2662bf3db84c5.mockapi.io/api/flutter/department/';
    try {
      final uri = Uri.parse(url+id);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(<String, dynamic>{'state':state}))
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