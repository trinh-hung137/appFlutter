import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/model/Times.dart';

import '../../../../../../main/data/model/BaseResponse.dart';

abstract class TimeAuthApi{
  Future<List<Times>> getAllTimeAppointment();//Done
  Future<Times> addTimeAppointment(Times time);//Done
  Future<BaseResponse> updateTimeAppointment(Times time);//Done
  Future<BaseResponse> deleteTimeAppointment(String id);//Done
}