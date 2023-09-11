import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/data/model/NhanVien.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class StaffApi{
  Future<List<NhanVien>> getAllStaff();
  Future<BaseResponse> addStaff(NhanVien nhanVien);
  Future<BaseResponse> updateStaff(NhanVien nhanVien);
  Future<BaseResponse> deleteStaff(String id);
}