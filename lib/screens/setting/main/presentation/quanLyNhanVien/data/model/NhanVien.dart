// To parse this JSON data, do
//
//     final nhanVien = nhanVienFromJson(jsonString);

import 'dart:convert';

import '../../../quanLyPhong/data/model/ListPhongKham.dart';

List<NhanVien> nhanVienFromJson(String str) => List<NhanVien>.from(json.decode(str).map((x) => NhanVien.fromJson(x)));

String nhanVienToJson(List<NhanVien> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class NhanVien {
  String maNv;
  String tenNv;
  String maBs;
  String loaiNv;
  String khoa;
  String phong;
  String email;
  String chucDanh;
  String trinhDo;
  String tenPhong;
  String hocHam;
  String hocVi;
  String sdt;
  String diaChi;
  String ngaySinh;
  String gioiTinh;
  String soBhyt;
  String soBhxh;
  String id;
  List<ListPhongKham> listPhong;

  NhanVien({
    required this.maNv,
    required this.tenNv,
    required this.maBs,
    required this.loaiNv,
    required this.khoa,
    required this.phong,
    required this.email,
    required this.chucDanh,
    required this.trinhDo,
    required this.tenPhong,
    required this.hocHam,
    required this.hocVi,
    required this.sdt,
    required this.diaChi,
    required this.ngaySinh,
    required this.gioiTinh,
    required this.soBhyt,
    required this.soBhxh,
    required this.id,
    required this.listPhong,
  });

  factory NhanVien.fromJson(Map<String, dynamic> json) => NhanVien(
    maNv: json["maNV"],
    tenNv: json["tenNV"],
    maBs: json["maBS"],
    loaiNv: json["loaiNV"],
    khoa: json["khoa"],
    phong: json["phong"],
    email: json["email"],
    chucDanh: json["chucDanh"],
    trinhDo: json["trinhDo"],
    tenPhong: json["tenPhong"],
    hocHam: json["hocHam"],
    hocVi: json["hocVi"],
    sdt: json["sdt"],
    diaChi: json["diaChi"],
    ngaySinh: json["ngaySinh"],
    gioiTinh: json["gioiTinh"],
    soBhyt: json["soBHYT"],
    soBhxh: json["soBHXH"],
    id: json["id"],
    listPhong: List<ListPhongKham>.from(json["listPhong"].map((x) => ListPhongKham.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "maNV": maNv,
    "tenNV": tenNv,
    "maBS": maBs,
    "loaiNV": loaiNv,
    "khoa": khoa,
    "phong": phong,
    "email": email,
    "chucDanh": chucDanh,
    "trinhDo": trinhDo,
    "tenPhong": tenPhong,
    "hocHam": hocHam,
    "hocVi": hocVi,
    "sdt": sdt,
    "diaChi": diaChi,
    "ngaySinh": ngaySinh,
    "gioiTinh": gioiTinh,
    "soBHYT": soBhyt,
    "soBHXH": soBhxh,
    "id": id,
    "listPhong": List<dynamic>.from(listPhong.map((x) => x.toJson())),
  };
}
