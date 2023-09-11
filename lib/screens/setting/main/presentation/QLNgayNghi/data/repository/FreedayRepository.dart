import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/model/FreeDay.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class FreedayRepository{
  Future<List<FreeDay>> getAllFreeday();
  Future<BaseResponse> addFreeday(FreeDay time);
  Future<BaseResponse> updateFreeday(FreeDay time);
  Future<BaseResponse> deleteFreeday(String id);
}