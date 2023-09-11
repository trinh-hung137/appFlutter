import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/manager-khoa/data/model/Khoa.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/manager-khoa/data/remote/KhoaApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/manager-khoa/data/repository/KhoaRepository.dart';
class KhoaRepositoryImpl implements KhoaRepository{
  late KhoaApi khoaApi;
  
  KhoaRepositoryImpl(KhoaApi khoaApi){
    this.khoaApi = khoaApi;
  }
  
  @override 
  Future<List<Department>> getAllKhoa(){
    return khoaApi.getAllKhoa();
  }
  @override
  Future<BaseResponse> addData(Department khoa){
    return khoaApi.addData(khoa);
  }

  @override
  Future<BaseResponse> updateData(Department khoa){
    return khoaApi.updateData(khoa);
  }

  @override
  Future<BaseResponse> deleteData(String id, String state){
    return khoaApi.deleteData(id, state);
  }
  
}