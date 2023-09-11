import 'dart:convert';

import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/model/Times.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/remote/TimeAuthApi.dart';

import '../../../../../../../utils/Constants.dart';
import '../../../../../../../utils/StorePreferences.dart';
import 'package:http/http.dart' as http;

class TimeAuthApiImpl implements TimeAuthApi {
  final String token = StorePreferences.getAccessToken();

  @override
  Future<BaseResponse> deleteTimeAppointment(String id) async{
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/time_appointment/';
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
  Future<List<Times>> getAllTimeAppointment() async {
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/time_appointment';
    try {
      // final params = {'PASSWORD': password, 'USERNAME': user};
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
        final List<dynamic> jsonList = json.decode(response.body);
        final List<Times> timeBlocks =
            jsonList.map((json) => Times.fromJson(json)).toList();
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
  Future<BaseResponse> updateTimeAppointment(Times time) async{
    String param=time.id.toString();
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/time_appointment/';
    try {
      final uri = Uri.parse(url+param);
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .put(uri, headers: headers, body: jsonEncode(time))
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
  Future<Times> addTimeAppointment(Times time) async{
    String url =
        'https://64d2e2e667b2662bf3db7e0a.mockapi.io/api/test/time_appointment';
    try {
      final uri = Uri.parse(url);
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(time))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == 201 ||
          response.statusCode == Bad_Request_Code) {
        return time;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }
}
