// To parse this JSON data, do
//
//     final listPhongKham = listPhongKhamFromJson(jsonString);

import 'dart:convert';

List<ListPhongKham> listPhongKhamFromJson(String str) => List<ListPhongKham>.from(json.decode(str).map((x) => ListPhongKham.fromJson(x)));

String listPhongKhamToJson(List<ListPhongKham> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ListPhongKham {
  String khoa;
  String khoaNoiTru;
  String maPhong;
  String maPhongBhyt;
  String soPhong;
  String tenPhong;
  String chuyenKhoa;
  String loaiPhong;
  String maDauDoc;
  String ghiChu;
  String qrCode;
  String diaChiPhong;
  String maMau;
  bool checkPhongGiaoSu;
  bool checkDangKiHen;
  String stt;
  String sttPhong;
  String chuyenKhoaDrop;
  String congKham;
  bool checkSuDung;
  bool tuVanOnline;
  bool datLichCsyt;
  String id;

  ListPhongKham({
    required this.khoa,
    required this.khoaNoiTru,
    required this.maPhong,
    required this.maPhongBhyt,
    required this.soPhong,
    required this.tenPhong,
    required this.chuyenKhoa,
    required this.loaiPhong,
    required this.maDauDoc,
    required this.ghiChu,
    required this.qrCode,
    required this.diaChiPhong,
    required this.maMau,
    required this.checkPhongGiaoSu,
    required this.checkDangKiHen,
    required this.stt,
    required this.sttPhong,
    required this.chuyenKhoaDrop,
    required this.congKham,
    required this.checkSuDung,
    required this.tuVanOnline,
    required this.datLichCsyt,
    required this.id,
  });

  factory ListPhongKham.fromJson(Map<String, dynamic> json) => ListPhongKham(
    khoa: json["khoa"],
    khoaNoiTru: json["khoaNoiTru"],
    maPhong: json["maPhong"],
    maPhongBhyt: json["maPhongBHYT"],
    soPhong: json["soPhong"],
    tenPhong: json["tenPhong"],
    chuyenKhoa: json["chuyenKhoa"],
    loaiPhong: json["loaiPhong"],
    maDauDoc: json["maDauDoc"],
    ghiChu: json["ghiChu"],
    qrCode: json["QRCode"],
    diaChiPhong: json["diaChiPhong"],
    maMau: json["maMau"],
    checkPhongGiaoSu: json["checkPhongGiaoSu"],
    checkDangKiHen: json["checkDangKiHen"],
    stt: json["stt"],
    sttPhong: json["sttPhong"],
    chuyenKhoaDrop: json["chuyenKhoaDrop"],
    congKham: json["congKham"],
    checkSuDung: json["checkSuDung"],
    tuVanOnline: json["tuVanOnline"],
    datLichCsyt: json["datLichCsyt"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "khoa": khoa,
    "khoaNoiTru": khoaNoiTru,
    "maPhong": maPhong,
    "maPhongBHYT": maPhongBhyt,
    "soPhong": soPhong,
    "tenPhong": tenPhong,
    "chuyenKhoa": chuyenKhoa,
    "loaiPhong": loaiPhong,
    "maDauDoc": maDauDoc,
    "ghiChu": ghiChu,
    "QRCode": qrCode,
    "diaChiPhong": diaChiPhong,
    "maMau": maMau,
    "checkPhongGiaoSu": checkPhongGiaoSu,
    "checkDangKiHen": checkDangKiHen,
    "stt": stt,
    "sttPhong": sttPhong,
    "chuyenKhoaDrop": chuyenKhoaDrop,
    "congKham": congKham,
    "checkSuDung": checkSuDung,
    "tuVanOnline": tuVanOnline,
    "datLichCsyt": datLichCsyt,
    "id": id,
  };
}
