import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vncare_qlhk/config/enviroment/Environment.dart';
import 'package:vncare_qlhk/screens/login/data/model/Token.dart';
import 'package:vncare_qlhk/screens/login/data/remote/AuthApi.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

class AuthApiImp implements AuthApi {
  final String apiHost = Environment().config.apiHost;
  final String token = StorePreferences.getAccessToken();
  @override
  Future<Token> login(String user, String password) async {
    try {
      final params = {'PASSWORD': password, 'USERNAME': user};
      final uri = Uri.https(
          apiHost, 'patient_api/api/QlhkMobile/v1.3.0/public/auth/gettoken');
      print('apiHost====' + uri.toString());
      var headers = {'Content-Type': 'application/json'};
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(params))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        return Token.fromJson(json.decode(response.body));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }

  @override
  Future<BaseResponse> revokeDeviceToken(String tokenFirebase) async {
    try {
      final uri = Uri.https(
          apiHost,
          'patient_api/api/QlhkMobile/v1.3.0/notification/revokeDeviceToken/' +
              tokenFirebase);
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      };
      final response = await http.delete(uri, headers: headers).timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      if (response.statusCode == OK_Code) {
        return BaseResponse.fromJson(json.decode(response.body));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }
}
