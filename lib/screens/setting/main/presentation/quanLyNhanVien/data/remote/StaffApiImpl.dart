import 'dart:convert';

import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';

import '../../../../../../../utils/Constants.dart';
import '../../../../../../../utils/StorePreferences.dart';
import '../model/NhanVien.dart';
import 'StaffApi.dart';
import 'package:http/http.dart' as http;

class StaffApiImpl implements StaffApi{
  final String token = StorePreferences.getAccessToken();

  @override
  Future<BaseResponse> addStaff(NhanVien nhanVien) async {
    // TODO: implement addStaff
    String apiUrl = 'https://64d4af54b592423e46947f71.mockapi.io/';
    String param = 'nhanVien/';
    try {
      final uri = Uri.parse(apiUrl+param);
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(nhanVien))
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
  Future<BaseResponse> deleteStaff(String id) async{
    String apiUrl = 'https://64d4af54b592423e46947f71.mockapi.io/nhanVien/';
    try {
      final uri = Uri.parse(apiUrl+id);
      print(uri);
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
  Future<List<NhanVien>> getAllStaff() async {
    String apiUrl = 'https://64d4af54b592423e46947f71.mockapi.io/';
    String param = 'nhanVien';
    try {
      final uri = Uri.parse(apiUrl+param);
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
        final List<NhanVien> listStaff =
        jsonList.map((json) => NhanVien.fromJson(json)).toList();
        return listStaff;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      print('==================\nloi:' + e.toString());
      throw Exception("There was a problem with the connection");
    }


  }

  @override
  Future<BaseResponse> updateStaff(NhanVien nhanVien) async {
    String apiUrl = 'https://64d4af54b592423e46947f71.mockapi.io/';
    String param = 'nhanVien/${nhanVien.id}';
    try {
      final uri = Uri.parse(apiUrl+param);
      print(uri);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(nhanVien))
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