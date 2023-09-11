import 'dart:convert';

import 'package:http/http.dart' as http;

class BaseApiNoToken {
  // String token = SharedPrefs().token;
  Future<dynamic> get(String api, String param) async {
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    };
    final response = await http.get(uri, headers: headers);
    if (response.statusCode == 200) {
      final result = utf8.decode(response.bodyBytes);
      return result;
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
    }
  }

  Future<dynamic> post(String api, String param, dynamic json) async {
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    };
    // var _payload = jsonEncode(object);
    final response = await http.post(
      uri,
      headers: headers,
      body: json,
    );
    if (response.statusCode == 201) {
      print('Thêm mới thành công');
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
    }
  }

  Future<dynamic> put(String api, String param, dynamic json) async {
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    };
    // var _payload = json.encode(object);
    final response = await http.put(uri, headers: headers, body: json);
    if (response.statusCode == 201) {
      print('Cập nhật thành công');
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
    }
  }

  Future<dynamic> delete(String api, String param) async {
    var uri = Uri.parse(api + param);
    var headers = {
      "Accept-Language": "vi",
      "Content-Type": "application/json",
      // "Authorization": "Bearer $token"
    };
    final response = await http.delete(uri, headers: headers);
    if (response.statusCode == 202) {
      print('Xóa thành công');
    } else {
      // return FailApiPopup(trangthai_api: 'Lỗi: ${response.statusCode}');
    }
  }
}
