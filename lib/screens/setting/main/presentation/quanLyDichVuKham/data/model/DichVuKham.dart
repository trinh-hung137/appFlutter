// To parse this JSON data, do
//
//     final dichVuKham = dichVuKhamFromJson(jsonString);

import 'dart:convert';

import '../../../quanLyPhong/data/model/ListPhongKham.dart';

List<DichVuKham> dichVuKhamFromJson(String str) => List<DichVuKham>.from(json.decode(str).map((x) => DichVuKham.fromJson(x)));

String dichVuKhamToJson(List<DichVuKham> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class DichVuKham {
  String maDichVu;
  String tenDichVu;
  String phiTuVanCu;
  String phiTuVanMoi;
  String phiDatLichCu;
  String phiDatLichMoi;
  String ngayAdGiaMoi;
  bool trangThai;
  String id;
  List<ListPhongKham> listPhong;

  DichVuKham({
    required this.maDichVu,
    required this.tenDichVu,
    required this.phiTuVanCu,
    required this.phiTuVanMoi,
    required this.phiDatLichCu,
    required this.phiDatLichMoi,
    required this.ngayAdGiaMoi,
    required this.trangThai,
    required this.id,
    required this.listPhong,
  });

  factory DichVuKham.fromJson(Map<String, dynamic> json) => DichVuKham(
    maDichVu: json["maDichVu"],
    tenDichVu: json["tenDichVu"],
    phiTuVanCu: json["phiTuVanCu"],
    phiTuVanMoi: json["phiTuVanMoi"],
    phiDatLichCu: json["phiDatLichCu"],
    phiDatLichMoi: json["phiDatLichMoi"],
    ngayAdGiaMoi: json["ngayAdGiaMoi"],
    trangThai: json["trangThai"],
    id: json["id"],
    listPhong: List<ListPhongKham>.from(json["listPhong"].map((x) => ListPhongKham.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "maDichVu": maDichVu,
    "tenDichVu": tenDichVu,
    "phiTuVanCu": phiTuVanCu,
    "phiTuVanMoi": phiTuVanMoi,
    "phiDatLichCu": phiDatLichCu,
    "phiDatLichMoi": phiDatLichMoi,
    "ngayAdGiaMoi": ngayAdGiaMoi,
    "trangThai": trangThai,
    "id": id,
    "listPhong": List<dynamic>.from(listPhong.map((x) => x.toJson())),
  };
}

