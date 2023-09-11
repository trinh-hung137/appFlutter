import 'dart:convert';

import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDichVuKham/data/model/DichVuKham.dart';
import '../../../../../../../utils/Constants.dart';
import '../../../../../../../utils/StorePreferences.dart';

import 'package:http/http.dart' as http;

import 'ServiceApi.dart';

class ServiceApiImpl implements ServiceApi{
  final String token = StorePreferences.getAccessToken();

  @override
  Future<BaseResponse> addService(DichVuKham dichVuKham) async {
    // TODO: implement addService
    String apiUrl = 'https://64d2f44d67b2662bf3db88c8.mockapi.io/';
    String param = 'dichVuKham/';
    try {
      final uri = Uri.parse(apiUrl+param);
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(dichVuKham))
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
  Future<BaseResponse> deleteService(String id) async{
    String apiUrl = 'https://64d2f44d67b2662bf3db88c8.mockapi.io/dichVuKham/';
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
  Future<List<DichVuKham>> getAllService() async {
    String apiUrl = 'https://64d2f44d67b2662bf3db88c8.mockapi.io/';
    String param = 'dichVuKham';
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
        final List<DichVuKham> listService =
        jsonList.map((json) => DichVuKham.fromJson(json)).toList();
        return listService;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      print('==================\nloi:' + e.toString());
      throw Exception("There was a problem with the connection");
    }


  }

  @override
  Future<BaseResponse> updateService(DichVuKham dichVuKham) async {
    String apiUrl = 'https://64d2f44d67b2662bf3db88c8.mockapi.io/';
    String param = 'dichVuKham/${dichVuKham.id}';
    try {
      final uri = Uri.parse(apiUrl+param);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(dichVuKham))
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