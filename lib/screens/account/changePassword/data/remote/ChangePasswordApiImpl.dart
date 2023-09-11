import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vncare_qlhk/config/enviroment/Environment.dart';
import 'package:vncare_qlhk/screens/account/changePassword/data/remote/ChangePasswordApi.dart';
import 'package:vncare_qlhk/screens/account/changePassword/data/model/ChangePasswordModel.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

class ChangePasswordApiImpl implements ChangePasswordApi {
  final String apiHost = Environment().config.apiHost;
  @override
  Future<ErrorMessageChangePassword> changepassword(
      String token, String oldpassword, String newpassword) async {
    try {
      final params = {
        'PASSWORD_OLD': oldpassword,
        'PASSWORD_NEW': newpassword,
      };
      final uri = Uri.https(
          apiHost, 'patient_api/api/QlhkMobile/v1.3.0/security/changePassword');
      var headers = {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ' + token,
      };
      final response = await http
          .post(uri, headers: headers, body: jsonEncode(params))
          .timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      StorePreferences.setHttpCode(response.statusCode);
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        return ErrorMessageChangePassword.fromJson(json.decode(response.body));
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      throw Exception("There was a problem with the connection");
    }
  }
}
