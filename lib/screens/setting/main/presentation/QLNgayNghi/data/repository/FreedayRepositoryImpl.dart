import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/model/FreeDay.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/remote/FreedayAuthApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/repository/FreedayRepository.dart';

class FreedayRepositoryImpl implements FreedayRepository{
  late FreedayAuthApi freedayAuthApi;

  FreedayRepositoryImpl(FreedayAuthApi freedayAuthApi){
    this.freedayAuthApi=freedayAuthApi;
  }

  @override
  Future<BaseResponse> addFreeday(FreeDay freeDay) {
    return freedayAuthApi.addFreeday(freeDay);
  }

  @override
  Future<BaseResponse> deleteFreeday(String id) {
    return freedayAuthApi.deleteFreeday(id);
  }

  @override
  Future<List<FreeDay>> getAllFreeday() {
    return freedayAuthApi.getAllFreeday();
  }

  @override
  Future<BaseResponse> updateFreeday(FreeDay freeDay) {
    return freedayAuthApi.updateFreeday(freeDay);
  }


}