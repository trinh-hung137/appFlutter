import 'package:rxdart/rxdart.dart';
import 'package:vncare_qlhk/screens/setting/main/presentation/manager-khoa/data/model/Khoa.dart';
//import 'package:http/http.dart' show PublishSubject;
import '../data/remote/KhoaApiImpl.dart';
import '../data/repository/KhoaRepositoryImpl.dart';
import '../../../../../main/data/model/BaseResponse.dart';

class ViewModelKhoa {
  var getKhoaSubject = PublishSubject<List<Department>>();

  Stream<List<Department>> get khoa => getKhoaSubject.stream;
  KhoaRepositoryImpl khoaRepositoryImpl = KhoaRepositoryImpl(KhoaApiImpl());

  void getAllKhoa() async {
    try {
      getKhoaSubject = PublishSubject<List<Department>>();
      getKhoaSubject.sink.add(await khoaRepositoryImpl.getAllKhoa());
    } catch (e) {
      await Future.delayed(Duration(microseconds: 500));
      getKhoaSubject.sink.addError(e);
    }
  }

  var addKhoaSubject = PublishSubject<BaseResponse>();
  Stream<BaseResponse> get addkhoa => addKhoaSubject.stream;
  void addKhoa(Department khoa) async {
    try {
      addKhoaSubject = PublishSubject<BaseResponse>();
      addKhoaSubject.sink.add(await khoaRepositoryImpl.addData(khoa));
    } catch (e) {
      await Future.delayed(Duration(microseconds: 500));
      addKhoaSubject.sink.addError(e);
    }
  }

  var updateKhoaSubject = PublishSubject<BaseResponse>();
  Stream<BaseResponse> get updatekhoa => updateKhoaSubject.stream;
  void updateKhoa(Department khoa) async {
    try {
      updateKhoaSubject = PublishSubject<BaseResponse>();
      updateKhoaSubject.sink.add(await khoaRepositoryImpl.updateData(khoa));
    } catch (e) {
      await Future.delayed(Duration(microseconds: 500));
      updateKhoaSubject.sink.addError(e);
    }
  }

  var deleteKhoaSubject = PublishSubject<BaseResponse>();
  Stream<BaseResponse> get deletekhoa => deleteKhoaSubject.stream;
  void deleteKhoa(String id, String state) async {
    try {
      deleteKhoaSubject = PublishSubject<BaseResponse>();
      deleteKhoaSubject.sink.add(await khoaRepositoryImpl.deleteData(id, state));
    } catch (e) {
      await Future.delayed(Duration(microseconds: 500));
      updateKhoaSubject.sink.addError(e);
    }
  }

  void closeObservable() {
    getKhoaSubject.close();
    addKhoaSubject.close();
    updateKhoaSubject.close();
    deleteKhoaSubject.close();
  }
}
