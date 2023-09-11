import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/model/Times.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/remote/TimeAuthApi.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/repository/TimeRepository.dart';

class TimeRepositoryImpl implements TimeRepository{
  late TimeAuthApi timeAuthApi;

  TimeRepositoryImpl(TimeAuthApi timeAuthApi){
    this.timeAuthApi=timeAuthApi;
  }

  @override
  Future<List<Times>> getAllTimeAppointment() {
    return timeAuthApi.getAllTimeAppointment();
  }

  @override
  Future<Times> addTimeAppointment(Times time) {
    print('===================\nvao goi api');
    return timeAuthApi.addTimeAppointment(time);
  }

  @override
  Future<BaseResponse> updateTimeAppointment(Times time) {
    return timeAuthApi.updateTimeAppointment(time);
  }

  @override
  Future<BaseResponse> deleteTimeAppointment(String id) {
    return timeAuthApi.deleteTimeAppointment(id);
  }

}