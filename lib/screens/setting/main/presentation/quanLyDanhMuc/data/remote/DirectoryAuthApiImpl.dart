
import 'dart:convert';
import 'dart:io';
import 'dart:io';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyDanhMuc/data/model/diretory.dart';

import '../../../../../../../utils/Constants.dart';
import '../model/diretory.dart';
import 'DirectoryAuthApi.dart';

class DirectoryAuthApiImpl implements DirectoryAuthApi {
  @override
  Future<Directory> getDirectory(index) async{
    String url =
        'https://64d48506b592423e46943417.mockapi.io/flutter/api/directory/';
    try {
      var headers = {'Content-Type': 'application/json'};
      final uri = Uri.parse(url+index);
      print('====================\nvao1');
      final response = await http.get(uri, headers: headers).timeout(
        Duration(seconds: TIME_OUT),
        onTimeout: () {
          return http.Response('Error', Server_Error_Code);
        },
      );
      print('====================\nvao2');
      if (response.statusCode == OK_Code ||
          response.statusCode == Bad_Request_Code) {
        print('====================\nvao3');
        final dynamic jsonList = json.decode(utf8.decode(response.bodyBytes));
        // print('====================\nvao4');
        final Directory timeBlocks = Directory.fromJson(jsonList as Map<String, dynamic>);
        return timeBlocks;
      } else {
        throw Exception("Error Code: ${response.statusCode}");
      }
    } catch (e) {
      print('==================\nloi:' + e.toString());
      throw Exception("There was a problem with the connection");
    }
  }

}
