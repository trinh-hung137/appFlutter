import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/main/data/model/RegisterDeviceParam.dart';

abstract class MainRepository {
  Future<BaseResponse> postRegisterDevice(RegisterDeviceParam param);
}
