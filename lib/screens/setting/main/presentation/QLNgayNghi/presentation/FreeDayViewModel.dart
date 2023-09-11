import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/model/FreeDay.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/remote/FreedayAuthApiImpl.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLNgayNghi/data/repository/FreedayRepositoryImpl.dart';

import '../../../../../main/data/model/BaseResponse.dart';

class FreeDayViewModel {
  var freeSubject = PublishSubject<List<FreeDay>>();

  Stream<List<FreeDay>> get freeday => freeSubject.stream;
  FreedayRepositoryImpl freedayRepositoryImpl =
      FreedayRepositoryImpl(FreedayAuthApiImpl());

  void getAllTimeAppointment() async {
    try {
      freeSubject = PublishSubject<List<FreeDay>>();
      freeSubject.sink.add(await freedayRepositoryImpl.getAllFreeday());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      freeSubject.sink.addError(e);
    }
  }

  var addFreedaySubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get addday => addFreedaySubject.stream;

  void addFreeday(FreeDay freeDay) async {
    try {
      addFreedaySubject = PublishSubject<BaseResponse>();
      addFreedaySubject.sink.add(
          (await freedayRepositoryImpl.addFreeday(freeDay)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      addFreedaySubject.sink.addError(e);
    }
  }

  var updateFreedaySubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get updateday => updateFreedaySubject.stream;

  void updateFreeday(FreeDay freeDay) async {
    try {
      updateFreedaySubject = PublishSubject<BaseResponse>();
      updateFreedaySubject.sink.add((await freedayRepositoryImpl
          .updateFreeday(freeDay)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      updateFreedaySubject.sink.addError(e);
    }
  }

  var deletefreedaySubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get deleteDay => deletefreedaySubject.stream;

  void deleteFreeday(String id) async {
    try {
      deletefreedaySubject = PublishSubject<BaseResponse>();
      deletefreedaySubject.sink.add(
          (await freedayRepositoryImpl.deleteFreeday(id)) );
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      deletefreedaySubject.sink.addError(e);
    }
  }
}
