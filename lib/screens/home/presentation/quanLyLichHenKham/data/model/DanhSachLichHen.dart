// To parse this JSON data, do
//
//     final danhSachLichHen = danhSachLichHenFromJson(jsonString);

import 'dart:convert';
DanhSachLichHen danhSachLichHenFromJson(String str) => DanhSachLichHen.fromJson(json.decode(str));

String danhSachLichHenToJson(DanhSachLichHen data) => json.encode(data.toJson());

class DanhSachLichHen {
  int errorCode;
  String errorMessage;
  Result result;

  DanhSachLichHen({
    required this.errorCode,
    required this.errorMessage,
    required this.result,
  });

  factory DanhSachLichHen.fromJson(Map<String, dynamic> json) => DanhSachLichHen(
    errorCode: json["errorCode"],
    errorMessage: json["errorMessage"],
    result: Result.fromJson(json["result"]),
  );

  Map<String, dynamic> toJson() => {
    "errorCode": errorCode,
    "errorMessage": errorMessage,
    "result": result.toJson(),
  };
}

class Result {
  int tongSo;
  int soDong;
  List<DanhSach> danhSach;

  Result({
    required this.tongSo,
    required this.soDong,
    required this.danhSach,
  });

  factory Result.fromJson(Map<String, dynamic> json) => Result(
    tongSo: json["tongSo"],
    soDong: json["soDong"],
    danhSach: List<DanhSach>.from(json["danhSach"].map((x) => DanhSach.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "tongSo": tongSo,
    "soDong": soDong,
    "danhSach": List<dynamic>.from(danhSach.map((x) => x.toJson())),
  };
}

class DanhSach {
  String henKhamId;
  String maDangKy;
  String soDienThoai;
  String maNguoiNhan;
  String maTrangThaiLichHen;
  String trangThaiLichHen;
  String maTrangThaiDenKham;
  String trangThaiDenKham;
  String tenBenhNhan;
  String doiTuongBenhNhan;
  String tenPhongKham;
  String yeuCauKham;
  String ngayGioHen;

  DanhSach({
    required this.henKhamId,
    required this.maDangKy,
    required this.soDienThoai,
    required this.maNguoiNhan,
    required this.maTrangThaiLichHen,
    required this.trangThaiLichHen,
    required this.maTrangThaiDenKham,
    required this.trangThaiDenKham,
    required this.tenBenhNhan,
    required this.doiTuongBenhNhan,
    required this.tenPhongKham,
    required this.yeuCauKham,
    required this.ngayGioHen,
  });

  factory DanhSach.fromJson(Map<String, dynamic> json) => DanhSach(
    henKhamId: json["henKhamId"],
    maDangKy: json["maDangKy"],
    soDienThoai: json["soDienThoai"],
    maNguoiNhan: json["maNguoiNhan"],
    maTrangThaiLichHen: json["maTrangThaiLichHen"],
    trangThaiLichHen: json["trangThaiLichHen"],
    maTrangThaiDenKham: json["maTrangThaiDenKham"],
    trangThaiDenKham: json["trangThaiDenKham"],
    tenBenhNhan: json["tenBenhNhan"],
    doiTuongBenhNhan: json["doiTuongBenhNhan"],
    tenPhongKham: json["tenPhongKham"],
    yeuCauKham: json["yeuCauKham"],
    ngayGioHen: json["ngayGioHen"],
  );

  Map<String, dynamic> toJson() => {
    "henKhamId": henKhamId,
    "maDangKy": maDangKy,
    "soDienThoai": soDienThoai,
    "maNguoiNhan": maNguoiNhan,
    "maTrangThaiLichHen": maTrangThaiLichHen,
    "trangThaiLichHen": trangThaiLichHen,
    "maTrangThaiDenKham": maTrangThaiDenKham,
    "trangThaiDenKham": trangThaiDenKham,
    "tenBenhNhan": tenBenhNhan,
    "doiTuongBenhNhan": doiTuongBenhNhan,
    "tenPhongKham": tenPhongKham,
    "yeuCauKham": yeuCauKham,
    "ngayGioHen": ngayGioHen,
  };
}
