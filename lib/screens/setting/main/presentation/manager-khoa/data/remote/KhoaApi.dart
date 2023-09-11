import 'package:vncare_qlhk/screens/setting/main/presentation/manager-khoa/data/model/Khoa.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class KhoaApi{
  Future<List<Department>> getAllKhoa() ;
  Future<BaseResponse> addData(Department khoa);
  Future<BaseResponse> updateData(Department khoa);
  Future<BaseResponse> deleteData(String id, String state);
}
