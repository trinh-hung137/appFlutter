import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/model/DVT.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/remote/DVTAuthApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/repository/DVTRepository.dart';

class DVTRepositoryImpl implements DVTRepository{
  late DVTAuthApi dvtAuthApi;

  DVTRepositoryImpl(DVTAuthApi dvtAuthApi){
    this.dvtAuthApi=dvtAuthApi;
  }
  @override
  Future<List<DuocVatTu>> getAllDuocVatTu() {
    return dvtAuthApi.getAllDuocVatTu();
  }

  @override
  Future<DuocVatTu> addDuocVatTu(DuocVatTu dvt) {
    return dvtAuthApi.addDuocVatTu(dvt);
  }

  @override
  Future<BaseResponse> deleteDuocVatTu(String id) {
    return dvtAuthApi.deleteDuocVatTu(id);
  }

  @override
  Future<BaseResponse> updateDuocVatTu(DuocVatTu dvt) {
    return dvtAuthApi.updateDuocVatTu(dvt);
  }

}