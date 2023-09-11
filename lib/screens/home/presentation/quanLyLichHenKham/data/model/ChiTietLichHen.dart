// To parse this JSON data, do
//
//     final chiTietLichHen = chiTietLichHenFromJson(jsonString);

import 'dart:convert';

ChiTietLichHen chiTietLichHenFromJson(String str) => ChiTietLichHen.fromJson(json.decode(str));

String chiTietLichHenToJson(ChiTietLichHen data) => json.encode(data.toJson());

class ChiTietLichHen {
  int errorCode;
  String errorMessage;
  Map<String, String> result;

  ChiTietLichHen({
    required this.errorCode,
    required this.errorMessage,
    required this.result,
  });

  factory ChiTietLichHen.fromJson(Map<String, dynamic> json) => ChiTietLichHen(
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    result: Map.from(json["result"]).map((k, v) => MapEntry<String, String>(k, v)),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "result": Map.from(result).map((k, v) => MapEntry<String, dynamic>(k, v)),
  };
}
