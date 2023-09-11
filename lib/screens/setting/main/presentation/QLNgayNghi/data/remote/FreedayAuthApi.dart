import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/model/FreeDay.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class FreedayAuthApi{
  Future<List<FreeDay>> getAllFreeday();//Done
  Future<BaseResponse> addFreeday(FreeDay freeDay);//Done
  Future<BaseResponse> updateFreeday(FreeDay freeDay);//Done
  Future<BaseResponse> deleteFreeday(String id);//Done
}