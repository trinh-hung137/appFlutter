import 'dart:convert';

import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/ChiTietLichHen.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/model/DanhSachLichHen.dart';
import 'package:vncare_qlhk/screens/home/presentation/quanLyLichHenKham/data/remote/ManageCaculatorApi.dart';
import 'package:vncare_qlhk/utils/StorePreferences.dart';
import 'package:http/http.dart' as http;

import '../../../../../../utils/Constants.dart';

class ManageCaculatorApiImpl implements ManageCaculatorApi{
  final String token = StorePreferences.getAccessToken();

  @override
  Future<ChiTietLichHen> getDetail(String id) async{
    String apiUrl =
        'https://staging-apidatlichkham.vncare.vn/patient_api/api/QlhkMobile/v1.3.0/business-service/chiTietLichHenKham?henKhamId=';
    try {
      final uri = Uri.parse(apiUrl+id);
      var headers = {
        "Accept-Language": "vi",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final response = await http.get(uri, headers: headers).timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      print('=====================\nvao 2');
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        ChiTietLichHen jsonChiTiet = json.decode(utf8.decode(response.bodyBytes));
        return jsonChiTiet;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      print('==================\nloi:' + e.toString());
      throw Exception("There was a problem with the connection");
    }
  }

  @override
  Future<List<DanhSach>> searchService(String param) async{
    String apiUrl =
        'https://staging-apidatlichkham.vncare.vn/patient_api/api/QlhkMobile/v1.3.0/business-service/danhSachLichHenKhamCsyt?';
    try {
      final uri = Uri.parse(apiUrl+param);
      var headers = {
        "Accept-Language": "vi",
        "Content-Type": "application/json",
        "Authorization": "Bearer $token"
      };
      final response = await http.get(uri, headers: headers).timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      print('=====================\nvao 2');
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        DanhSachLichHen jsonDanhSach = json.decode(utf8.decode(response.bodyBytes));
        Result ketqua = jsonDanhSach.result;
        final List<DanhSach> list = ketqua.danhSach;
        return list;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      print('==================\nloi:' + e.toString());
      throw Exception("There was a problem with the connection");
    }
  }
}