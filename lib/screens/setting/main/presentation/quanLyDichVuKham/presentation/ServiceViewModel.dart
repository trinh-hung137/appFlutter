
import 'package:rxdart/rxdart.dart';

import '../../../../../main/data/model/BaseResponse.dart';
import '../data/model/DichVuKham.dart';
import '../data/remote/ServiceApiImpl.dart';
import '../data/repository/ServiceRespositoryImpl.dart';

class ServiceViewModel{
  var serviceSubject = PublishSubject<List<DichVuKham>>();
  Stream<List<DichVuKham>> get service => serviceSubject.stream;
  ServiceRespositoryImpl respositoryImpl = ServiceRespositoryImpl(ServiceApiImpl());

  void getAllServiceManage() async {
    try {
      serviceSubject = PublishSubject<List<DichVuKham>>();
      serviceSubject.sink.add(await respositoryImpl.getAllService());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      serviceSubject.sink.addError(e);
    }
  }

  var addServiceSubject = PublishSubject<BaseResponse>();
  Stream<BaseResponse> get addservice => addServiceSubject.stream;

  void addServicee(DichVuKham dichVuKham) async {
    try {
      addServiceSubject = PublishSubject<BaseResponse>();
      addServiceSubject.sink.add(
          (await respositoryImpl.addService(dichVuKham)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      addServiceSubject.sink.addError(e);
    }
  }
  var updateServiceSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get updateservice => updateServiceSubject.stream;

  void updateServicee(DichVuKham dichVuKham) async {
    try {
      updateServiceSubject = PublishSubject<BaseResponse>();
      updateServiceSubject.sink.add((await respositoryImpl
          .updateService(dichVuKham)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      updateServiceSubject.sink.addError(e);
    }
  }
  var deleteServiceSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get deleteservice => deleteServiceSubject.stream;

  void deleteServicee(String id) async {
    try {
      deleteServiceSubject = PublishSubject<BaseResponse>();
      deleteServiceSubject.sink.add(
          (await respositoryImpl.deleteService(id)) );
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      deleteServiceSubject.sink.addError(e);
    }
  }

}