import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/model/DVT.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class DVTAuthApi{
  Future<List<DuocVatTu>> getAllDuocVatTu();//Done
  Future<DuocVatTu> addDuocVatTu(DuocVatTu dvt);//Done
  Future<BaseResponse> updateDuocVatTu(DuocVatTu dvt);//Done
  Future<BaseResponse> deleteDuocVatTu(String id);//Done
}