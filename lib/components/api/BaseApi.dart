import 'dart:convert';

import 'package:http/http.dart' as http;


class BaseApi {
  String token = '';
  //String token = SharedPrefs().token;
  Future<dynamic> get(String api, String param) async {
    print('co vao');
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final result = utf8.decode(response.bodyBytes);
      return result;
    } else {
      print('Lỗi: ${response.statusCode}');
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
    }
  }

  Future<dynamic> post(String api, dynamic object) async {
    var uri = Uri.parse(api);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var _payload = json.encode(object);
    final response = await http.post(uri, body: _payload, headers: headers);
    if (response.statusCode == 200) {
      final result = utf8.decode(response.bodyBytes);
      return result;
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
      print('Lỗi: ${response.statusCode}');
    }
  }

  Future<dynamic> put(String api, String param, dynamic object) async {
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    var _payload = json.encode(object);
    final response = await http.post(uri, body: _payload, headers: headers);
    if (response.statusCode == 200) {
      final result = utf8.decode(response.bodyBytes);
      return result;
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
      print('Lỗi: ${response.statusCode}');
    }
  }

  Future<dynamic> delete(String api, String param) async {
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
    final response = await http.delete(uri, headers: headers);
    if (response.statusCode == 200) {
      final result = utf8.decode(response.bodyBytes);
      return result;
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
      print('Lỗi: ${response.statusCode}');
    }
  }
}
