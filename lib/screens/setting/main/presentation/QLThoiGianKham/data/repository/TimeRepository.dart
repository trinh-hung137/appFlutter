import '../../../../../../main/data/model/BaseResponse.dart';
import '../model/Times.dart';

abstract class TimeRepository{
  Future<List<Times>> getAllTimeAppointment();
  Future<Times> addTimeAppointment(Times time);
  Future<BaseResponse> updateTimeAppointment(Times time);
  Future<BaseResponse> deleteTimeAppointment(String id);
}