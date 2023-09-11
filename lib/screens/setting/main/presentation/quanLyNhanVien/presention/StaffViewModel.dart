
import 'package:http/http.dart' show PublishSubject;
import 'package:rxdart/rxdart.dart';
import '../../../../../main/data/model/BaseResponse.dart';
import '../data/model/NhanVien.dart';
import '../data/remote/StaffApiImpl.dart';
import '../data/repository/StaffRespositoryImpl.dart';

class StaffViewModel{
  var staffSubject = PublishSubject<List<NhanVien>>();
  Stream<List<NhanVien>> get staff => staffSubject.stream;
  StaffRespositoryImpl respositoryImpl = StaffRespositoryImpl(StaffApiImpl());

  void getAllStaffManage() async {
    try {
      staffSubject = PublishSubject<List<NhanVien>>();
      staffSubject.sink.add(await respositoryImpl.getAllStaff());
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      staffSubject.sink.addError(e);
    }
  }

  var addStaffSubject = PublishSubject<BaseResponse>();
  Stream<BaseResponse> get addstaff => addStaffSubject.stream;

  void addStafff(NhanVien nhanVien) async {
    try {
      addStaffSubject = PublishSubject<BaseResponse>();
      addStaffSubject.sink.add(
          (await respositoryImpl.addStaff(nhanVien)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      addStaffSubject.sink.addError(e);
    }
  }
  var updateStaffSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get updatestaff => updateStaffSubject.stream;

  void updateStafff(NhanVien nhanVien) async {
    try {
      updateStaffSubject = PublishSubject<BaseResponse>();
      updateStaffSubject.sink.add((await respositoryImpl
          .updateStaff(nhanVien)));
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      updateStaffSubject.sink.addError(e);
    }
  }
  var deleteStaffSubject = PublishSubject<BaseResponse>();

  Stream<BaseResponse> get deletestaff => deleteStaffSubject.stream;

  void deleteStafff(String id) async {
    try {
      deleteStaffSubject = PublishSubject<BaseResponse>();
      deleteStaffSubject.sink.add(
          (await respositoryImpl.deleteStaff(id)) );
    } catch (e) {
      await Future.delayed(Duration(milliseconds: 500));
      deleteStaffSubject.sink.addError(e);
    }
  }

}