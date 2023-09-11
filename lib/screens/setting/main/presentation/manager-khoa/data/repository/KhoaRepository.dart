import '../../../../../../main/data/model/BaseResponse.dart';
import '../model/Khoa.dart';

abstract class KhoaRepository{
  Future<List<Department>> getAllKhoa() ;
  Future<BaseResponse> addData(Department khoa);
  Future<BaseResponse> updateData(Department khoa);
  Future<BaseResponse> deleteData(String id, String state);
}