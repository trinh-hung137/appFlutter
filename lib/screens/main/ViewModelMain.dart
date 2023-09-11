import 'package:rxdart/rxdart.dart' show PublishSubject;
import 'package:vncare_qlhk/screens/main/data/model/BaseResponse.dart';
import 'package:vncare_qlhk/screens/main/data/model/RegisterDeviceParam.dart';
import 'package:vncare_qlhk/screens/main/data/remote/MainApiImpl.dart';
import 'package:vncare_qlhk/screens/main/data/repository/MainRepositoryImpl.dart';

class ViewModelMain {
  var registerDeviceSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get registerDevice => registerDeviceSubject.stream;
  MainRepositoryImpl mainRepositoryImpl = MainRepositoryImpl(MainApiImpl());

  void postRegisterDevice(RegisterDeviceParam param) async {
    try {
      registerDeviceSubject = PublishSubject<BaseResponse>();
      registerDeviceSubject.sink
          .add(await mainRepositoryImpl.postRegisterDevice(param));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      registerDeviceSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    registerDeviceSubject.close();
  }
}
