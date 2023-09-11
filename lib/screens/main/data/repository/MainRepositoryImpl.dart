import 'package:vncare_qlhk/screens/main/data/model/RegisterDeviceParam.dart';
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/main/data/remote/MainApi.dart';
import 'package:vncare_qlhk/screens/main/data/repository/MainRepository.dart';

class MainRepositoryImpl implements MainRepository {
  late MainApi mainApi;

  MainRepositoryImpl(MainApi mainApi) {
    this.mainApi = mainApi;
  }

  @override
  Future<BaseResponse> postRegisterDevice(RegisterDeviceParam param) {
    return mainApi.postRegisterDevice(param);
  }
}
