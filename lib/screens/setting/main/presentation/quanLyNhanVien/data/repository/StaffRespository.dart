import '../../../../../../main/data/model/BaseResponse.dart';
import '../model/NhanVien.dart';

abstract class StaffRespository{
  Future<List<NhanVien>> getAllStaff();
  Future<BaseResponse> addStaff(NhanVien nhanVien);
  Future<BaseResponse> updateStaff(NhanVien nhanVien);
  Future<BaseResponse> deleteStaff(String id);
}