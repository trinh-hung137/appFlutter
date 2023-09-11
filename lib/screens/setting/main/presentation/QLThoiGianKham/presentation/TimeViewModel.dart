import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/model/Times.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/remote/TimeAuthApiImpl.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLThoiGianKham/data/repository/TimeRepositoryImpl.dart';

class TimeViewModel {
  var timeSubject = PublishSubject<List<Times>>();

  Stream<List<Times>> get time => timeSubject.stream;
  TimeRepositoryImpl timeRepositoryImpl = TimeRepositoryImpl(TimeAuthApiImpl());

  void getAllTimeAppointment() async {
    try {
      timeSubject = PublishSubject<List<Times>>();
      timeSubject.sink.add(await timeRepositoryImpl.getAllTimeAppointment());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      timeSubject.sink.addError(e);
    }
  }

  var addTimeSubject = PublishSubject<Times>();

  Stream<Times> get addTime => addTimeSubject.stream;

  void addTimeAppointment(Times time) async {
    try {
      addTimeSubject = PublishSubject<Times>();
      addTimeSubject.sink.add(
          (await timeRepositoryImpl.addTimeAppointment(time)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      timeSubject.sink.addError(e);
    }
  }

  var updateTimeSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get updateTime => updateTimeSubject.stream;

  void updateTimeAppointment(Times time) async {
    try {
      updateTimeSubject = PublishSubject<BaseResponse>();
      updateTimeSubject.sink.add((await timeRepositoryImpl
          .updateTimeAppointment(time)) as BaseResponse);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      timeSubject.sink.addError(e);
    }
  }

  var deleteTimeSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get deleteTime => deleteTimeSubject.stream;

  void deleteTimeAppointment(String id) async {
    try {
      deleteTimeSubject = PublishSubject<BaseResponse>();
      deleteTimeSubject.sink.add(
          (await timeRepositoryImpl.deleteTimeAppointment(id)) as BaseResponse);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      timeSubject.sink.addError(e);
    }
  }
}
