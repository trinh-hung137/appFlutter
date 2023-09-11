import 'package:http/http.dart';
import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/model/DVT.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/remote/DVTAuthApiImpl.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/QLDuocVatTu/data/repository/DVTRepositoryImpl.dart';

class DVTViewModel{
  var dvtSubject = PublishSubject<List<DuocVatTu>>();

  Stream<List<DuocVatTu>> get dvt => dvtSubject.stream;
  DVTRepositoryImpl dvtRepositoryImpl = DVTRepositoryImpl(DVTAuthApiImpl());

  void getAllTimeAppointment() async {
    try {
      dvtSubject = PublishSubject<List<DuocVatTu>>();
      dvtSubject.sink.add(await dvtRepositoryImpl.getAllDuocVatTu());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      dvtSubject.sink.addError(e);
    }
  }

  var addDVTSubject=PublishSubject<DuocVatTu>();
  Stream<DuocVatTu> get addDVT=>addDVTSubject.stream;
  void addDuocVatTu(DuocVatTu dvt) async {
    try {
      addDVTSubject = PublishSubject<DuocVatTu>();
      addDVTSubject.sink.add(
          (await dvtRepositoryImpl.addDuocVatTu(dvt)) );
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      addDVTSubject.sink.addError(e);
    }
  }

  var updateDVTSubject=PublishSubject<BaseResponse>();
  Stream<BaseResponse> get updateDVT=>updateDVTSubject.stream;
  void updateDuocVatTu(DuocVatTu dvt) async {
    try {
      updateDVTSubject = PublishSubject<BaseResponse>();
      updateDVTSubject.sink.add(
          (await dvtRepositoryImpl.updateDuocVatTu(dvt)) as BaseResponse);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      updateDVTSubject.sink.addError(e);
    }
  }

  var deleteDVTSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get deleteDVT => deleteDVTSubject.stream;

  void deleteDuocVatTu(String id) async {
    try {
      deleteDVTSubject = PublishSubject<BaseResponse>();
      deleteDVTSubject.sink.add(
          (await dvtRepositoryImpl.deleteDuocVatTu(id)) as BaseResponse);
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      deleteDVTSubject.sink.addError(e);
    }
  }
}