
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/data/model/NhanVien.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/data/remote/StaffApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/quanLyNhanVien/data/repository/StaffRespository.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

class StaffRespositoryImpl implements StaffRespository{
  late StaffApi staffApi;
  StaffRespositoryImpl(StaffApi staffApi){
    this.staffApi = staffApi;
  }
  @override
  Future<BaseResponse> addStaff(NhanVien nhanVien) {
    // TODO: implement addStaff
    return staffApi.addStaff(nhanVien);
  }

  @override
  Future<BaseResponse> deleteStaff(String id) {
    // TODO: implement deleteStaff
    return staffApi.deleteStaff(id);
  }

  @override
  Future<List<NhanVien>> getAllStaff() {
    // TODO: implement getAllStaff
    return staffApi.getAllStaff();
  }

  @override
  Future<BaseResponse> updateStaff(NhanVien nhanVien) {
    // TODO: implement updateStaff
    return staffApi.updateStaff(nhanVien);
  }

}