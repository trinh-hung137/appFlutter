import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/model/DVT.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class DVTRepository{
  Future<List<DuocVatTu>> getAllDuocVatTu();
  Future<DuocVatTu> addDuocVatTu(DuocVatTu dvt);
  Future<BaseResponse> updateDuocVatTu(DuocVatTu dvt);
  Future<BaseResponse> deleteDuocVatTu(String id);
}