import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:vncare_qlhk/config/enviroment/Environment.dart';
import 'package:vncare_qlhk/screens/main/data/model/RegisterDeviceParam.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/main/data/remote/MainApi.dart';
import 'package:vncare_qlhk/utils/Constants.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';

class MainApiImpl implements MainApi {
  final String apiHost = Environment().config.apiHost;
  final String token = StorePreferences.getAccessToken();

  @override
  Future<BaseResponse> postRegisterDevice(RegisterDeviceParam param) async {
    try {
      final params = {
        'deviceToken': param.deviceToken,
        'devudidiceToken': param.udid,
        'os': param.os,
        'type': param.type,
      };
      final uri = Uri.https(
          apiHost,
          'patient_api/api/QlhkMobile/v1.3.0/notification/registerDeviceToken',
          params);
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
